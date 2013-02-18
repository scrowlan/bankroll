require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "Sign In Page" do
    before { visit signin_path }

    it { should have_selector('h1',    text: 'Sign In') }
    it { should have_selector('title', text: 'Sign In') }
  end
  
  describe "Sign In" do
    before { visit signin_path }
    
    describe "with invalid information" do
      before { click_button "Sign In" }
      
      it { should have_selector('title', text: 'Sign In') }
      it { should have_selector('div.alert.alert-error', text: 'Invalid') }
      
      describe "after visiting another page" do
        before { click_link "Home" }
        it { should_not have_selector('div.alert.alert-error') }
      end
      
    end
    
    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before { sign_in user }
      
      it { should have_selector('title', text: user.first_name) }
      it { should have_link('Profile', href: user_path(user)) }
      it { should have_link('Settings', href: edit_user_path(user)) }
      it { should have_link('Sign Out', href: signout_path) }
      it { should_not have_link('Sign In', href: signin_path) }
      
      describe "followed by signout" do
        before { click_link 'Sign Out' }
        it { should have_link('Sign In') }
      end
      
    end
    
  end 
  
  describe "authorization" do
    
    describe "for non-signed in users" do
      let(:user) { FactoryGirl.create(:user) }
      
      describe "when attempting to visit a protected page"
        before do
          visit edit_user_path(user)
          fill_in  "Email", with: user.email
          fill_in "Password", with: user.password
          click_button "Sign In"
        end
      describe "after signing in" do 
        
        it "should render the desired protected page" do
          page.should have_selector('title', text: 'Edit User')
        end
      end  

      describe "in the Users controller" do
        
        describe "visiting the edit page" do
          before { visit edit_user_path(user) }
          it { should have_selector('title', text: 'Edit User') }
        end
        
        describe "submitting to the update action" do
          before { put user_path(user) }
          specify { response.should redirect_to(signin_path) }
        end
      end
      
      describe "in the Rolls controller" do
        
        describe "submitting to the create action" do
          before { post rolls_path }
          specify { response.should redirect_to(signin_path) }
        end
        
        describe "submitting to the delete action" do
          before { delete rolls_path(FactoryGirl.create(roll)) }
          specify { response.should redirect_to(sigin_path) }
        end
      end
    end
    
    describe "as wrong user" do
      let(:user) { FactoryGirl.create(:user) }
      let(:wrong_user) { FactoryGirl.create(:user, email: "wrong@example.com") }
      before { sign_in user }
      
      describe "visiting Users#edit page" do
        before { visit edit_user_path(wrong_user) }
        it { should_not have_selector('title', text: full_title('Edit user')) }
      end
      
      describe "submitting a PUT request to the Users#update action" do
        before { put user_path(wrong_user) }
        specify { response.should redirect_to(root_path) }
      end
    end    
  end
  
end