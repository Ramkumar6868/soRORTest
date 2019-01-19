class InvoiceNumbersController < ApplicationController

	def new
	end

	def parse_number
		begin
			if params[:file][:datafile].respond_to? :read
				content = File.read(params[:file][:datafile].tempfile)
				@numbers = InvoiceNumber.parse_seven_segment_string(content)
				send_data @numbers, filename: "output_numbers.txt"
			else
				redirect_to action: "new"
			end
		rescue => ex
			flash[:danger] = "Error while processing file.Make sure file only contains valid 7 segment invoce numbers"
			redirect_to action: "new"
		end
	end 
end
