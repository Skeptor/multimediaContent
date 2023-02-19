require 'rails_helper'

RSpec.describe User, type: :model do
  
  it "is not valid without valid attributes" do
    expect(User.new).not_to be_valid
  end

  it "is valid with valid attributes" do
    expect(User.create(email: "Test@test.com")).to be_valid
end

end
