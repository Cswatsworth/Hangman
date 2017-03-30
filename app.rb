require 'sinatra'
require_relative 'hangman.rb'
#class Hangman < Sinatra::Base

enable :sessions

get '/' do
	
	erb :names
end


post '/names' do
	session[:backend_p1_name] = params[:p1_name_input].capitalize
	session[:backend_p2_name] = params[:p2_name_input].capitalize

	if session[:backend_p1_name] == '' || session[:backend_p2_name] == ''
		redirect '/'
	end
	erb :secret_word, :locals => {:p1 => session[:backend_p1_name], :p2 => session[:backend_p2_name]}
end


get '/secret_word' do

	erb :secret_word, :locals => {:p1 => session[:backend_p1_name], :p2 => session[:backend_p2_name]}
end


post '/secret_word' do
	session[:secret_word] = params[:secret_word_input]
	session[:hangman] = KeywordClass.new(params[:secret_word_input].upcase)

		if session[:hangman].valid_input? == false
			redirect '/secret_word'
		end

		redirect '/guess'
	
end


get '/guess' do
	session[:underscores] = session[:hangman].underscores.join
	session[:already] = [].join
	session[:countdown] = session[:hangman].wrong
	

		if session[:countdown] == 0
			erb :lose, :locals => {:p1 => session[:backend_p1_name], :p2 => session[:backend_p2_name], :secret => session[:secret_word]}
		else
			erb :guess, :locals => {:already => session[:already], :guess => session[:guess], :wrong => session[:countdown], :underscores => session[:underscores], :secret => session[:hangman], :p1 => session[:backend_p1_name], :p2 => session[:backend_p2_name]}
		end
end


get '/game' do
	session[:underscores] = session[:hangman].underscores.join
	session[:already] = session[:hangman].already_guessed(session[:guess]).join('-')
	session[:countdown] = session[:hangman].wrong
	
		if session[:countdown] == 0
			erb :lose, :locals => {:p1 => session[:backend_p1_name], :p2 => session[:backend_p2_name], :secret => session[:secret_word]}
		else
			erb :guess, :locals => {:already => session[:already], :guess => session[:guess], :wrong => session[:countdown], :underscores => session[:underscores], :secret => session[:hangman], :p1 => session[:backend_p1_name], :p2 => session[:backend_p2_name]}
		end
end


post '/guess' do
	session[:guess] = params[:guess_input]
	session[:hangman].guess_letter(session[:guess])

		if session[:hangman].underscores.include?('_ ')
			redirect '/game' 
		else
			erb :win, :locals => {:p1 => session[:backend_p1_name], :p2 => session[:backend_p2_name]}
		end
			
		
end

