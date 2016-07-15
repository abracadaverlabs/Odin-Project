#This method will take the projected values of a stock over any amount of days and it will tell you the best days to buy and sell for maximum return.
def stock_picker(stocks)

	#This array will contain a short list of all the differences for buy/sell dates that meet certain criteria
	list = [0]
	
	#Here we can construct the list from above
	stocks.each do |buyday|
		stocks.each do |sellday|
			diff = (buyday - sellday)
			buyindex = stocks.index(buyday)
			sellindex = stocks.index(sellday)
			if (buyindex < sellindex) && (buyday < sellday) 
				list << diff
			end
		end
	end

	#Sort the list so we can use the index to choose the highest value
	listsorted = list.sort

	#We'll find the best days to buy and sell using the data from our list
	stocks.each do |buyday| 
		stocks.each do |sellday|
			diff = (buyday - sellday)
			buyindex = stocks.index(buyday) + 1
			sellindex = stocks.index(sellday) + 1
			if (buyindex < sellindex) && (buyday < sellday) 
				if diff == listsorted[0]
					diff = diff * -1
					puts "The projection for this stock is as follows:"
					stocks.each do |projection|
					puts "Day " + stocks.index(projection).to_s + ": $" + projection.to_s
					end
					puts "\n"
					puts "Day #" + buyindex.to_s + " is the best projected day to buy this stock."
					puts "\n"
					puts "To get maximum return, be sure to sell it by day #" + sellindex.to_s + " to get a profit of " + diff.to_s + " dollars."
					puts "\n" 
				end
			end
		end 
	end 
end

stock_picker([1,4,2,5])	
stock_picker([100,40,30,54,287,102,510,28,101])
	