require 'rails_helper'
RSpec.describe InvoiceNumbersController, type: :controller do
	describe "get new" do
		it "has a 200 status code" do
			get "new"
			expect(response.status).to eq(200)
			expect(response).to render_template("invoice_numbers/new")
	    end
	end

	describe "post parse_number" do
		it "Error while processing invalid file" do
			@file = fixture_file_upload(Rails.root + 'public/numbers.txt')
			post "parse_number", :params => {"file" => {"datafile"=> @file}}
			expect(response.status).to eq(302)
			expect(flash[:danger]).to match(/Error while processing file.Make sure file only contains valid 7 segment invoce numbers/)
	    end

	    it "has a 200 status code during valid file" do
			@file = fixture_file_upload(Rails.root + 'public/input_user_story_1.txt')
			post "parse_number", :params => {"file" => {"datafile"=> @file}}
			expect(response.status).to eq(200)
			expect(response.header['Content-Type']).to eq("text/plain")
			file = fixture_file_upload(Rails.root + 'public/output_numbers.txt')
			expect(response.body).to eq(File.read(file))
	    end
	end

end
