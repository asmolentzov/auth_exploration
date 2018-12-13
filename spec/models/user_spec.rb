require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:password) }
    it { should validate_uniqueness_of(:email) }
  end
  
  describe 'Class Methods' do
    describe '.authenticate' do
      it 'should return the user if valid, else nil' do
        user = User.create(name: "Jane Doe", email: "janedoe@gmail.com", password: "password123")
        
        expect(User.authenticate(user.email, user.password)).to eq(user)
        expect(User.authenticate("hi", nil)).to eq(nil)
      end
    end
  end
end