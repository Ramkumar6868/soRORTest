class MacroPoloController < ApplicationController
	def index
		@answers = macro_polo
	end

	private

	def macro_polo
		result = '1'
		(2).step(99,1) do |i|
			if(i%4 ==0 && i%7 ==0)
				result += ", macroplo"
			elsif i%4 == 0
				result += ", macro"
			elsif i%7 == 0
				result += ", polo"
			else
				result += ", " + i.to_s
			end
		end
		return result + ", 100"
	end
end
