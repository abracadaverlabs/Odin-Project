def caesar(x,y) 
	code = ""
	off = y.to_i
	x.each_char do |i|
		letter = i.ord
		combo = letter + off
		if letter > 64
			combo -= 26 if (((letter < 91) && (combo > 90)) || ((letter > 95) && (combo > 122)))
			code << combo.chr
		elsif
			code << letter
		end
	end
	puts "I have translated your phrase into the lord's tongue: \n" + code
end

def getPhrase
	puts "Speak to me, son. I will translate your speech to the Gods' tongue."
	phrase = gets.chomp
	puts "How misaligned do you feel, son?"
	offset = gets.chomp
	caesar(phrase,offset)
end
	
getPhrase