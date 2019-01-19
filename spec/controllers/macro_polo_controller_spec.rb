require 'rails_helper'

RSpec.describe MacroPoloController, type: :controller do
	describe "get 100 macro polo answers" do
		it "has a 200 status code" do
			get "index"
			expect(response.status).to eq(200)
			expect(assigns(:answers)).to eq("1, 2, 3, macro, 5, 6, polo, macro, 9, 10, 11, macro, 13, polo, 15, macro, 17, 18, 19, macro, polo, 22, 23, macro, 25, 26, 27, macroplo, 29, 30, 31, macro, 33, 34, polo, macro, 37, 38, 39, macro, 41, polo, 43, macro, 45, 46, 47, macro, polo, 50, 51, macro, 53, 54, 55, macroplo, 57, 58, 59, macro, 61, 62, polo, macro, 65, 66, 67, macro, 69, polo, 71, macro, 73, 74, 75, macro, polo, 78, 79, macro, 81, 82, 83, macroplo, 85, 86, 87, macro, 89, 90, polo, macro, 93, 94, 95, macro, 97, polo, 99, 100")
	    end
	end
end
