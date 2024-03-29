require 'spec_helper'

describe Game do
  
  let (:user) { FactoryGirl.create(:user) }
  
  before { @game = user.games.build(amount: 14.23) }
  
  subject { @game }
  
  it { should respond_to(:amount) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its (:user) { should == user }
  
  it { should be_valid }
  
  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Roll.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end
  
  describe "when user_id is not present" do
    before { @game.user_id = nil }
    it { should_not be_valid }
  end
  
end
