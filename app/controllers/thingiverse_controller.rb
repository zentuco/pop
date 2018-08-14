require 'thingiverse'

# tv.things.search "cat"

class ThingiverseController < ApplicationController
  before_action :set_tv, only: [:search_thingiverse]

  def search_thingiverse
    @designs = @tv.things.search "cat"
    @things = []
    @designs.each do |design|
      @things << @tv.things.find(design["id"])
    end
  end


  private
  def set_tv
    @tv = Thingiverse::Connection.new
    @tv.access_token = ENV['THINGIVERSE_APP_TOKEN']
  end
end
