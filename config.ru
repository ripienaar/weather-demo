require "rubygems"
require "forecast_io"
require "sinatra"
require "json/pure"
require "pp"

raise("No FORECAST_API environment variable set") unless ENV["FORECAST_API"]
raise("No FORECAST_LON environment variable set") unless ENV["FORECAST_LON"]
raise("No FORECAST_LAT environment variable set") unless ENV["FORECAST_LAT"]
raise("No FORECAST_LOCATION environment variable set") unless ENV["FORECAST_LOCATION"]

MultiJson.use :json_pure

ForecastIO.configure do |configuration|
  configuration.api_key = ENV["FORECAST_API"]
end

set :public_folder, "public"
set :static, true

helpers do
  def weekday(day)
    ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"][day]
  end
end

get '/' do
  @forecast = ForecastIO.forecast(ENV["FORECAST_LON"], ENV["FORECAST_LAT"], :params => {:units => "si"})

  erb :forecast
end
