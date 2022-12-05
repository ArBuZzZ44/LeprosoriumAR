#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "leprosorium.db"}

class Post < ActiveRecord::Base 
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
	#@results = @db.execute 'select * from Posts order by id desc'
	erb :index
end

get '/new' do
	erb :new
end

post '/new' do
	
end

get '/details/:id' do
	 # post_id = params[:id]

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