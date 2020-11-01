require 'rest-client'
require 'json'

class GetGoogleCoffeeListService 
    def initialize(latitude, longitude)
        @latitude = latitude
        @longitude = longitude
    end

    def call
        begin
            key = Rails.application.credentials.google_secret_key
            location = "location=#{@latitude},#{@longitude}"
            query = "query=coffe+shops&#{location}&radius=5000&key=#{key}"
            base_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?#{query}"

            response = RestClient.get base_url

            JSON.parse(response.body)
        rescue RestClient::ExceptionWithResponse => 
            e.response
        end
    end 
end
