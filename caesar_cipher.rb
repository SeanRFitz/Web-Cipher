require 'sinatra'
require 'sinatra/reloader'

get '/' do
	original_text = params["words"]
	encrypted_text = 'enter caesar_cipher method here'
	erb :index, :locals => {:original_text => original_text,
							:encrypted_text => encrypted_text}
end