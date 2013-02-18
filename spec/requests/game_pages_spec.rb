require 'spec_helper'

describe "Game pages" do
  
  subject { page }
  
  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }
  
  describe "Game creation" do
    before { visit root_path }
    
    describe "with invalid information" do
      
      it "should not create a game" do
        expect { click_button "Submit" }.not_to change(Game, :count)
      end
      
      describe "error messages" do
        before { click_button "Submit" }
        it { should have_content('error') }
      end
    end
    
    describe "with valid information" do
              
      before { fill_in 'game_amount', with: 123.43 }
      it "should create a game" do
        expect { click_button "Submit" }.to change(Game, :count).by(1)
      end
    end
  end
  
  describe "Game destruction" do
    before { FactoryGirl.create(:game, user: :user) }
    
    describe "As correct user" do
      before { visit root_path }
      
      it "should delete a bankgame" do
        expect { click_link "delete" }.to change(Game, :count).by(-1)
      end
    end
  end
end