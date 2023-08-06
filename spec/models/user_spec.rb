require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_confirmation_of :password }
    it { should validate_presence_of :password }
  end

  describe "instance methods" do
    describe "#generate_api_key" do
      it "should generate an api key" do
        user = User.create!(name: "test", email: "stackmm@gmail.com", password: "password", password_confirmation: "password")
        expect(user.api_key).to_not eq(nil)
      end
    end
  end
end
