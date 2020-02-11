require 'rails_helper'

RSpec.describe User, type: :model do
  

  describe 'Validations' do

    before do
      @password="123"
      @user = User.new(
        name: "Jay",
        email: "abc@abc",
        password: @password,
        password_confirmation: @password
      )
    end
    
    #Inputs are provided?
    it "is not created if the email is not provided" do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it "is not created if the name is not provided" do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it "is not created if the pasword is not provided" do
      @user.password = nil
      expect(@user).to_not be_valid
    end

    it "is not created if the password_confiramtion is not provided" do
      @user.password_confirmation = nil
      expect(@user).to_not be_valid
    end

    #Email unique?
    it "is not created if the email is not unique" do
      @user.email = "SJS5953@hotmail.com"
      expect(@user).to_not be_valid
    end

    #Password match?
    it "is not created if password do not match" do
      @user.password_confirmation = "THIS SHOULD FAIL PLEASE"
      expect(@user).to_not be_valid
    end

    #Password length?
    it "is not created if password do not match" do
      @user.password = "THIS"
      expect(@user).to_not be_valid
    end

  end
 
  
  #Authentication


  describe '.authenticate_with_credentials' do
    # before do
    #   @password="123123"
    #   # @user = User.create(
    #   #   name: "Jay",
    #   #   email: "abc@abc",
    #   #   password: @password,
    #   #   password_confirmation: @password
    #   # )
    # end

    let(:password) { "123123" }
    let(:user) { User.create(
      name: "Jay",
      email: "abc@abc",
      password: password,
      password_confirmation: password
    ) }

    it "returns user if user does exist" do
      result = User.authenticate_with_credentials(user.email, password)
      expect(result.name).to eq("Jay")
    end

    it "returns nil if user does not exist" do
      result = User.authenticate_with_credentials("not@exists","notexists")
      expect(result).to be_nil
    end

    it "returns nil if empty string given" do
      result = User.authenticate_with_credentials("","")
      expect(result).to be_nil
    end

    it "returns nil if empty space given" do
      result = User.authenticate_with_credentials(" "," ")
      expect(result).to be_nil
    end

    it "returns nil if long empty spaces given" do
      result = User.authenticate_with_credentials("     "," ")
      expect(result).to be_nil
    end

    it "User still can login with spaces around email" do
      result = User.authenticate_with_credentials(" "+user.email+" ",password)
      expect(result.name).to eq("Jay")
    end

    it "User still can login with the wrong case" do
      result = User.authenticate_with_credentials(user.email.upcase,password)
      expect(result.name).to eq("Jay")
    end

  end

end
