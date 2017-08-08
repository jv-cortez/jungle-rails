require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.create first_name: 'John', last_name: 'John', email: 'test@test.com', password: 'String', password_confirmation: 'String'
    @baduser = User.create
  end

  describe "Validations" do

    it 'should have a first name' do 
      expect(@user).to be_valid
      expect(@baduser.errors.messages[:first_name]).to include('can\'t be blank')
    end

    it 'should have a last name' do 
      expect(@user).to be_valid
      expect(@baduser.errors.messages[:last_name]).to include('can\'t be blank')
    end

    it 'should have a email' do 
      expect(@user).to be_valid
      expect(@baduser.errors.messages[:email]).to include('can\'t be blank')
    end

    it 'should have a password' do 
      expect(@user).to be_valid
      expect(@baduser.errors.messages[:password]).to include('can\'t be blank')
    end

    it 'shoud have more than 6 char for password' do 
      @shortpassword = User.create first_name: 'John', 
                       last_name:'John', 
                       email:'test@test.com', 
                       password:'Stop',
                       password_confirmation:'Stop'
      expect(@shortpassword).to_not be_valid
    end

    describe '.authenticate_with_credentials' do


      it 'should authenticate with the credentials' do
        user = User.authenticate_with_credentials('test@test.com', 'String')
        expect(user).to eql(@user)
      end

      it 'blocks authenticate with credentials' do
        user = User.authenticate_with_credentials('toast@test.com', 'String')
        expect(user).to_not eql(@user)
      end
    end
    #   it 'should have a pasword confirmation' do 
    #   expect(@user).to be_valid
    #   expect(@baduser.errors.messages[:first_name]).to include('can\'t be blank')
    # end
  end
end
