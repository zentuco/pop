module Thingiverse
  class Things
    include Thingiverse::DynamicAttributes

    # GET /search/{term}
    def self.search(term)
      query = URI::encode(term)
      Thingiverse::Connection.get("/search/#{query}")
    end

    # GET /things/{thing_id}
    def self.find(thing_id)
      response = Thingiverse::Connection.get("/things/#{thing_id}")
      raise "#{response.code}: #{JSON.parse(response.body)['error']} #{response.headers['x-error']}" unless response.success?
      self.new response.parsed_response
    end

    # GET /things/{id}/files/
    def files
      Thingiverse::Connection.get(@files_url)
    end

    # GET /things/{id}/images/
    def images
      Thingiverse::Connection.get(@images_url)
    end

    # GET /things/{id}/categories
    def categories
      Thingiverse::Connection.get(@categories_url)
    end
  end
end
