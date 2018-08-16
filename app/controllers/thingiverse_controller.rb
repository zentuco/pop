require 'thingiverse'

# tv.things.search "cat"

class ThingiverseController < ApplicationController
  before_action :set_tv, only: [:show, :search_thingiverse]
  skip_before_action :authenticate_user!, only: [:search_thingiverse]

  def search_thingiverse
    @designs = @tv.things.search params[:thingname]
    if @designs.code == 200
      @things = []
      @designs.each do |design|
        @things << @tv.things.find(design["id"])
      end
    else
      @things = []
    end
  end

  def show
    @thing = @tv.things.find(params[:id].to_i)
    @request = Request.new
  end

  def create_design
    @attachment = Attachment.new(remote_file_url: params[:photo])
    @category = Category.find_by(name: params[:category].downcase)
    @category = Category.create!(name: params[:category].downcase) unless @category
    @design = Design.new(name: params[:name], description: params[:description])
    @design.category = @category
    # authorize @design
    @request = Request.new(request_params)
    @request.user = current_user
    @request.kind = :improve
    @contribution = Contribution.new(contribution_params)
    @contribution.user = current_user
    if @design.save!
      @attachment.design = @design
      @attachment.save!
      @request.design = @design
      if @request.save!
        @contribution.request = @request
        if @contribution.save!
          tokens = current_user.wallet.tokens - @contribution.tokens
          current_user.wallet.update(tokens: tokens)
          redirect_to @design
        else
          flash[:alert] = "Contribution invalid."
        end
      else
        flash[:alert] = "Request did not save"

      end
    else
      flash[:alert] = "Design did not save"

    end
  end


  private
  def set_tv
    @tv = Thingiverse::Connection.new
    @tv.access_token = ENV['THINGIVERSE_APP_TOKEN']
  end

  def contribution_params
    params.require(:contribution).permit(:tokens)
  end

  def request_params
    params.require(:request).permit(:description)
  end
end
