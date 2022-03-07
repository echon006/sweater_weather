require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should have_secure_password }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end

  it 'encrypts password' do
    user = User.create!(email: 'email_1@test.com', password: 'test_1', password_confirmation: 'test_1')
    expect(user).to_not have_attribute(:password)
    expect(user).to_not have_attribute(:password_confirmation)
    expect(user.password_digest).to_not eq('test_1')
  end
end
