require 'sinatra/base'
require 'data_mapper'


env = ENV["RACK_ENV"] || "development"
DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")

require './lib/link'

DataMapper.finalize
DataMapper.auto_upgrade!

class Bookmark < Sinatra::Base

post '/' do 
# puts params[:title]
# puts params[:url]
Link.create(:title => params[:title],:url => params[:url])
puts params[:title]
puts params[:url]
	
redirect to("/")
end

get '/' do
	@links = Link.all
	erb :index
end


end