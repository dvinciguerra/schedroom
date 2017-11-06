require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the AuthHelper. For example:
#
# describe AuthHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ApplicationHelper, type: :helper do
  
	describe "#page_title" do
    it "checks if page title is rendering" do
      expect(helper.page_title("I'm a page")).to match /I&#39;m a page/
    end
  end

  describe "#show_header_date" do
    it "returns date to be placed at header of page" do
			expect(helper.show_header_date).to match /^(Segunda|Terça|Quarta|Quinta|Sexta|Sabado|Domingo)/
    end
  end

  describe "#days_of_week" do
    it "returns list of days of an specific week" do
			expect(helper.days_of_week(41)).to include Date.new(2017, 10, 9)
    end
    it "checks dates that dont be in range" do
			day_list = helper.days_of_week(41)
			expect(day_list).not_to include Date.new(2017, 10, 8)
			expect(day_list).not_to include Date.new(2017, 10, 14)
    end
  end


  describe "#number_to_hours" do
    it "returns a formated hour given an integer" do
			expect(helper.number_to_hours(6)).to eq '06:00'
    end
  end

end
