class HomeController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        escaped_address = URI.escape("https://covid19-api.org/api/status") 
        uri = URI.parse(escaped_address)
        response = Net::HTTP.get(uri)
		parsed_response = JSON.parse(response)
		parsed_response.each do |hash| CoronaDatum.find_by(country: hash['country']).update(confirmed_cases: hash['cases']) end
        @data = CoronaDatum.pluck(:country, :confirmed_cases)
    end

    def receive_data
        data = request.body.read
        if data.present?
            data = JSON.parse(data)
            data.each do |hash| CoronaDatum.find_by(country: hash['country']).update(confirmed_cases: hash['cases']) end
            render :json => {:status => 200}
        else
            render :json => {:status => 404}
        end
    end
end
