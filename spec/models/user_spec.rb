require 'rails_helper'

RSpec.describe User, type: :model do

  it "is valid with email and password" do
    user = User.new(email_address: "test@test.com", password: "password")
    expect(user).to be_valid
  end

  it "is invalid without email" do
    user = User.new(email_address: nil, password: "password")
    expect(user).not_to be_valid
  end

  it "is invalid without password" do
    user = User.new(email_address: "test@test.com", password: nil)
    expect(user).not_to be_valid
  end

end
