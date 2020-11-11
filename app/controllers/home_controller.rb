class HomeController < ApplicationController
    def index
        @data = CoronaDatum.pluck(:country, :confirmed_cases)
    end
    def receive_data
        data = request.body.read
        JSON.parse(data)
        data['Countries'].each do |hash| CoronaData.find_by(country: hash['CountryCode']).update(confirmed_cases: hash['TotalConfirmed']) end
    end
end
