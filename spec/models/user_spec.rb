require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    context 'given valid user parameters' do
      it 'creates a valid user' do
        @new_user = User.new({
          name: "neo jones",
          email: "test@test.com",
          password: "somepw5",
          password_confirmation: "somepw5"
      })
        expect(@new_user).to be_valid
      end
    end
    context 'given name is nil' do
      it 'creates an invalid user' do
        @new_user = User.new({
          name: nil,
          email: "test@test.com",
          password: "somepw5",
          password_confirmation: "somepw5"
      })
        @new_user.valid?
        expect(@new_user).to be_invalid
      end
    end
    context 'given email as nil' do
      it 'creates an invalid user' do
        @new_user = User.new({
          name: 'neo jones',
          email: nil,
          password: "somepw5",
          password_confirmation: "somepw5"
      })
        @new_user.valid?
        expect(@new_user.errors.full_messages).to include("Email can't be blank")
      end
    end
    context 'given only first name' do
      it 'creates an invalid user' do
        @new_user = User.new({
          name: 'neo',
          email: 'test@test.com',
          password: "somepw5",
          password_confirmation: "somepw5"
      })
        @new_user.valid?
        expect(@new_user.errors.full_messages).to include("Name must have first and last name")
      end
    end
    context 'given password and confirm password are not the same' do
      it 'should give password confirmation error' do
        @new_user = User.new({
          name: "neo jones",
          email: "test@test.com",
          password: "somepw",
          password_confirmation: "something else"
      })
        @new_user.valid?
        expect(@new_user.errors.full_messages).to include("Password confirmation doesn't match Password") 
      end
    end
    context 'given a new user with same email as another user' do
      it 'newest user should not be valid' do
        @new_user = User.new({
          name: "neo jones",
          email: "test@test.com",
          password: "somepw1",
          password_confirmation: "somepw1"
        })
        @new_user2 = User.new({
        name: "eon",
        email: "TEST@TEST.COM",
        password: "somepw2",
        password_confirmation: "somepw2"
        }) 
        #First user must be saved to database to check against emails
        @new_user.save
        @new_user2.valid?
        expect(@new_user2.errors.full_messages).to include("Email has already been taken") 
      end
    end   
  end
  describe '.authenticate_with_credentials' do
    context 'given correct credentials' do
      it 'returns the specified user' do
        @new_user = User.new({
          name: "neo jones",
          email: "test@test.com",
          password: "somepw1",
          password_confirmation: "somepw1"
        })
        @new_user.save
        auth = User.authenticate_with_credentials('test@test.com', 'somepw1')
        expect(auth).to be_truthy
      end
    end
    context 'given correct email with uppercases' do 
      it 'returns the specified user' do
        @new_user = User.new({
          name: "neo jones",
          email: "test@test.com",
          password: "somepw1",
          password_confirmation: "somepw1"
        })
        @new_user.save
        auth = User.authenticate_with_credentials('teSt@tEst.CoM', 'somepw1')
        expect(auth).to be_truthy
      end
    end
    context 'given correct email with spaces' do 
      it 'returns the specified user' do
        @new_user = User.new({
          name: "neo jones",
          email: "test@test.com",
          password: "somepw1",
          password_confirmation: "somepw1"
        })
        @new_user.save
        auth = User.authenticate_with_credentials('   teSt@tEst.CoM     ', 'somepw1')
        expect(auth).to be_truthy
      end
    end
    context 'given incorrect password' do
      it 'returns false' do
        @new_user = User.new({
          name: "neo jones",
          email: "test@test.com",
          password: "somepw1",
          password_confirmation: "somepw1"
        })
        @new_user.save
        auth = User.authenticate_with_credentials('test@test.com', 'wrong_pw')
        puts auth
        expect(auth).to be_falsey
      end
    end
    context 'given incorrect email' do
      it 'returns false' do
        @new_user = User.new({
          name: "neo jones",
          email: "test@test.com",
          password: "somepw1",
          password_confirmation: "somepw1"
        })
        @new_user.save
        auth = User.authenticate_with_credentials('test1@test.com', 'somepw1')
        puts auth
        expect(auth).to be_falsey
      end
    end


  end
end
