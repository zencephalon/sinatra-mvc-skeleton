require 'spec_helper'
require_relative '../spec_helper'
# require_relative '../../app/models/user'


RSpec.describe User, :type => :model do
  it "is valid with valid attributes" do
    expect(User.new({username: 'bolko', email: 'botlko@yahoo.com', phone_number: 4157564006, encrypted_password: 'sadfssdf' })).to be_valid
  end
end


describe User do 
  let(:user) {User.create({username: 'bolko', email: 'botlko@yahoo.com', phone_number: 4157564006, encrypted_password: 'sadfssdf' })}

  describe "has attributes" do
    it "has a username" do
      expect(user.username == 'bolko').to be_truthy
    end
    it "has email" do
      expect(user.email == 'botlko@yahoo.com').to be_truthy
    end
  end

  describe "has validations" do
    it 'is valid with a valid name' do
      expect(user).to be_valid
    end
  end


  describe 'associations' do 
    before(:each) do 
      @forecast1 = Forecast.create!(country: 'Bulgaria', city: 'Sofia', user_id: 1)
      @user1 = User.create!(username: 'botilko', email: 'botilko@gmail.com', phone_number: 4157564008, encrypted_password: "blah123")
    end
    it 'returns users username' do 
      expect(@user1.username).to eq 'botilko'
    end
  end
end



  # describe '#username' do
  #   it { is_expected.to validate_presence_of(:username) }
  #   it { is_expected.to validate_presence_of(:email) }
  # end



  # describe 'validations' do
  #   it { should validate_presence_of :username }
  # end



  # describe "has associations" do
  #   it { is_expected.to have_many(:forecasts)}
  # end


  # describe User do
  # it { should have_many :forecasts }
  # end



