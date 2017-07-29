require 'sinatra'
require 'sinatra/reloader' if development?

def caesar_cipher(str, num)
	final_str = ""
	str.each_char do |character|
		if !character.match(/[A-Z]|[a-z]/)
			final_str += character
			next
		end

		alph_index = character.ord + num
		if character.match(/[A-Z]/)
			while alph_index > 90
				alph_index -= 26
			end
		else
			while alph_index > 122
				alph_index -= 26
			end
		end

		final_str += alph_index.chr
	end
	final_str
end

get '/' do
	original_text = params["words"]
	cipher_number = params["cipher_number"].to_i
	encrypted_text = caesar_cipher(original_text,cipher_number)
	erb :index, :locals => {:original_text => original_text,
							:encrypted_text => encrypted_text,
							:cipher_number => cipher_number}
end