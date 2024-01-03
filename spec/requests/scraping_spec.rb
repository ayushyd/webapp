require 'rails_helper'

RSpec.describe "Scrapings", type: :request do

    describe "GET /index" do
    
    it "should open index page" do
      expect(page).to have_current_path(root_path)
      
    end
  end
end
