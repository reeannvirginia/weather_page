require 'sinatra'
require 'httparty'
# require 'JSON'

get '/' do

  url = 'http://api.openweathermap.org/data/2.5/weather?q=Miami&appid=c38d29204353577f04f9a8b861e3c70e'

  response = HTTParty.get url
  @date = response["dt"]
  @newDate = Time.at(@date)
  @temp = response['main']['temp']
  @celc = (@temp - 273.15).round(2)
  @description = response['weather'][0]['description']

  puts @date
  puts response.headers["date"]

  print "Today's temperature is #{@celc}"
  puts " with #{response['weather'][0]['description']}"

  erb File.read("weather_page.html.erb")

end



#
# <!-- require 'httparty'
#
#
#
# class Wk41v1
# attr_accessor :page_url
# attr_accessor :response
# attr_accessor :date
#
# def initialize
#   @page_url = "http://api.openweathermap.org/data/2.5/weather?q=Miami%20Beach,FL&appid=c38d29204353577f04f9a8b861e3c70e"
#   @response = HTTParty.get(@page_url)
#   @date = @response.headers["date"]
# end
#
# def save_date
#   page = File.read('./template.html.erb')
#   result = ERB.new(page).result(binding)
#   File.open('saved_date.html', 'w+') do |f|
#     f.write result
#   end
#   # page.print("<h1>"+@response.headers["date"]+"</h1>")
# end
#
# end
#
# date = Wk41v1.new
# date.save_date -->
