require 'httparty'
require 'nokogiri'
require "sinatra"

get "/" do
  erb :root
end

get "/stock" do
  p params
  response = HTTParty.get("http://finance.yahoo.com/q?s=#{params["stock"].upcase}")

  dom = Nokogiri::HTML(response.body)


  my_span = dom.xpath("//span[@id='yfs_l84_#{params["stock"].downcase}']").first

  @price ="$" + my_span.content
  erb :result
end




