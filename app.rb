require 'sinatra'
require_relative 'hangman.rb'
class Hangman < Sinatra::Base

	

	get '/' do
		erb :name
	end

	post '/name' do
		backend_p1name = params[:p1_name_input]
		backend_p2name = params[:p2_name_input]
		

		erb :secret_word, :locals => {player1: backend_p1name, player2: backend_p2name}
	end

	get '/secret_word' do

		erb :secret_word, :locals => {player1: backend_p1name, player2: backend_p2name}
	end

	post '/secret_word' do
		backend_p1name = params[:p1_name_input]
		backend_p2name = params[:p2_name_input]
		backend_secret_word = params[:word_input]
		
		hangman = KeywordClass.new(params[:word_input])
	
		erb :play_game, :locals => {player1: backend_p1name, player2: backend_p2name, secret_word: backend_secret_word}

 	end

# 	get '/play_game' do
# 		backend_p1name = params[:p1_name_input]
# 		backend_p2name = params[:p2_name_input]
# 		backend_secret_word = params[:word_input]

# 		erb :play_game, :locals => {player1: backend_p1name, player2: backend_p2name, secret_word: backend_secret_word}
# 	end


	post '/play_game' do
		backend_p1name = params[:p1_name_input]
		backend_p2name = params[:p1_name_input]
		backend_secret_word = params[:word_input]
		backend_guess = params[:guess_input]
		

		
		erb :play_game, :locals => {player1: backend_p1name, player2: backend_p2name, secret_word: backend_secret_word, guess: backend_guess}
	end
end



