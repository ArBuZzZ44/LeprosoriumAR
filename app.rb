#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "leprosorium.db"}

class Post < ActiveRecord::Base
	validates :name, presence: true, length: {minimum: 3}
	validates :content, presence: true  
end


# configure do
# 	init_db
# 	@db.execute 'CREATE TABLE if not exists Posts 
# 		(
# 			id INTEGER PRIMARY KEY AUTOINCREMENT,
# 			created_date DATE,
# 			content TEXT,
# 			username TEXT
# 		)' 
# 	@db.execute 'CREATE TABLE if not exists Comments 
# 		(
# 			id INTEGER PRIMARY KEY AUTOINCREMENT,
# 			created_date DATE,
# 			comment TEXT,
# 			post_id INTEGER
# 		)' 
# end

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
	 @post_id = Post.find(params[:id])

	 # results = @db.execute 'select * from Posts where id = ?', [post_id]
	 # @row = results[0]

	 # @comments = @db.execute 'select * from Comments where post_id = ? order by id', [post_id]

	 erb :details
end

post '/details/:id' do
	# post_id = params[:id]
	# @comment = params[:comment]

	# if @comment.length <= 0
	# 	@error = "Type comment"
	# 	redirect to ('/details/' + post_id)
	# end

	# @db.execute 'insert into Comments (comment, created_date, post_id) values (?, datetime(), ?)', [@comment, post_id]

	# redirect to ('/details/' + post_id)

end