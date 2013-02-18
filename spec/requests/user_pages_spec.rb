require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    let!(:r1) { FactoryGirl.create(:roll, user: user, amount: 123.34) }
    
    before { visit user_path(user) }

    it { should have_selector('h1',    text: user.first_name) }
    it { should have_selector('title', text: user.first_name) }
    
    describe "rolls" do
      it { should have_content(r1.amount) }
    end
  end

  describe "signup page" do
    before { visit signup_path }

    it { should have_selector('h1',    text: 'Sign Up') }
    it { should have_selector('title', text: full_title('Sign Up')) }
  end
  
  describe "signup" do

    before { visit signup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "First Name",         with: "Example"
        fill_in "Last Name",  with: "User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
      
      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by_email('user@example.com') }

        it { should have_selector('title', text: user.first_name) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
        it { should have_link('Sign Out') }
      end
      
    end
  end
  
  describe "edit" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in user
      visit edit_user_path(user)
    end
      
    describe "page" do
      it { should have_selector('h1', text: "Update your profile") }
      it { should have_selector('title', text: "Edit User") }
    end
    
    describe "with valid information" do
      let(:new_first_name) { "New" }
      let(:new_last_name) { "Name" }
      let(:new_email) { "new@example.com" }
     
      before do
        fill_in "First Name", with: new_first_name
        fill_in "Last Name", with: new_last_name
        fill_in "Email", with: new_email
        fill_in "Password", with: user.password
        fill_in "Confirmation", with: user.password
        click_button "Save changes"
      end
      
      it { should have_selector('title', text: new_first_name) }
      it { should have_selector('div.alert.alert-success') }
      it { should have_link('Sign Out') }
      specify { user.reload.first_name.should == new_first_name }
      specify { user.reload.last_name.should == new_last_name }
      specify { user.reload.email.should == new_email }
      
    end
  end
  
end