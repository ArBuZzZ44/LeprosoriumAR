#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "leprosorium.db"}

class Post < ActiveRecord::Base
	has_many :comments
	validates :name, presence: true, length: {minimum: 3}
	validates :content, presence: true  
end

class Comment < ActiveRecord::Base 
	validates :comment, presence: true
end

get '/' do
	@posts = Post.order("created_at DESC")
	erb :index
end

get '/new' do
	@p = Post.new
	erb :new
end

post '/new' do
	@p = Post.new params[:post]
	if @p.save
		redirect to '/'
	else
		@error = @p.errors.full_messages.first
		erb :new
	end
	
end

get '/details/:id' do
	@post = Post.find(params[:id])
	@comments = @post.comments
	@c = Comment.new

	erb :details
end

post '/details/:id' do
  	@c = Comment.new params[:comment]
	
	if @c.save
		erb :details
	else	
		@error = @c.errors.full_messages.first
		erb :details
	end

end