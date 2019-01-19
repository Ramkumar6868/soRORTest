class InvoiceNumber < ApplicationRecord
	def self.parse_seven_segment_string(content)
		# split file content by each line
		lines = content.split("\n")
      	retVal = ""
      	(0).step(lines.length-1, 4) do |line|
      		retVal += self.parse_numbers(lines[line..line+3]) + "\n"
		end
		return retVal
	end

	private

	# parse numbers from segments
	def self.parse_numbers(segment_numbers)
      	# since each segemnt in three lines. so get each line and split for a number
		seg_numbers_line1 = segment_numbers[0].split('')
  		seg_numbers_line2 = segment_numbers[1].split('')
  		seg_numbers_line3 = segment_numbers[2].split('')
  		number_length = seg_numbers_line1.length 
  		numbers = ''
  		(0).step(number_length-1, 3) do |i| 
  			if(i < number_length-2)
  				numbers_code = self.get_number_code(seg_numbers_line1[i..i+2], seg_numbers_line2[i..i+2], seg_numbers_line3[i..i+2])
  				numbers += self.map_code_to_number(numbers_code)
      		end
  		end
  		return numbers
	end

	# get code from segments for number
	def self.get_number_code(seg_numbers_line1, seg_numbers_line2, seg_numbers_line3)
		# seven segment number like:
		#    1_
		# 6| 7_ |2
		# 5| 4_ |3
		number_code = seg_numbers_line1[1] == '_' ? '1' : ''
		number_code += seg_numbers_line2[2] == '|' ? '2' : ''
		number_code += seg_numbers_line3[2] == '|' ? '3' : ''
		number_code += seg_numbers_line3[1] == '_' ? '4' : ''
		number_code += seg_numbers_line3[0] == '|' ? '5' : ''
		number_code += seg_numbers_line2[0] == '|' ? '6' : ''
		number_code += seg_numbers_line2[1] == '_' ? '7' : ''
		return number_code
	end

	# map code to number
	def self.map_code_to_number(code)
		case code
		when '123456'
			return '0'
		when '23'
			return '1'
		when '12457'
			return '2'
		when '12347'
			return '3'
		when '2367'
			return '4'
		when '13467'
			return '5'
		when '134567'
			return '6'
		when '123'
			return '7'
		when '1234567'
			return '8'
		when '123467'
			return '9'
		else
			return '?'
		end
	end
end
