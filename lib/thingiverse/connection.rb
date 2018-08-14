module Thingiverse
  class Connection
    include HTTParty
    format :json
    # access_token

    base_uri 'https://api.thingiverse.com'

    attr_accessor :access_token, :base_url

    def base_url=(url)
      @base_url = url
      self.class.base_uri(url)
    end

    def base_url
      @base_url || 'https://api.thingiverse.com'
    end

    def access_token=(token)
      @access_token = token
      self.class.headers "Authorization" => "Bearer #{@access_token}"
    end

    def things
      Thingiverse::Things
    end
  end
end
