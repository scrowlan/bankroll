require 'spec_helper'

describe "Roll pages" do
  
  subject { page }
  
  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }
  
  describe "Roll creation" do
    before { visit root_path }
    
    describe "with invalid information" do
      
      it "should not create a roll" do
        expect { click_button "Submit" }.not_to change(Roll, :count)
      end
      
      describe "error messages" do
        before { click_button "Submit" }
        it { should have_content('error') }
      end
    end
    
    describe "with valid information" do
              
      before { fill_in 'roll_amount', with: 123.43 }
      it "should create a roll" do
        expect { click_button "Submit" }.to change(Roll, :count).by(1)
      end
    end
  end
  
  describe "Roll destruction" do
    before { FactoryGirl.create(:roll, user: :user) }
    
    describe "As correct user" do
      before { visit root_path }
      
      it "should delete a bankroll" do
        expect { click_link "delete" }.to change(Roll, :count).by(-1)
      end
    end
  end
end