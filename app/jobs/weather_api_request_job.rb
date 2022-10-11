# frozen_string_literal: true

class WeatherApiRequestJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    api_url = 'https://api.openweathermap.org/data/2.5/weather'
    response = HTTParty.get(api_url, query: { lat: 60, lon: 30, appid: ENV['API_KEY'], units: :metric }, format: :json)
    temperature = response['main']['temp']
    File.open('current_temp.txt', 'w') { |file| file.write(temperature.to_s) }
  end
end
