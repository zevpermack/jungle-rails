require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    context 'given password and confirm password are not the same' do
      it 'should not be a valid user' do
        @new_user = User.new()
        @new_user2 = User.new()
        @new_user.password = "somepw"
        @new_user2.password = "somepw"
        @new_user.email = "test@test.com"
        @new_user2.email = "TEST@TEST.COM"

        p @new_user2
        puts @new_user2.valid?
        puts @new_user2.errors.full_messages
      end
    end
  end
end
