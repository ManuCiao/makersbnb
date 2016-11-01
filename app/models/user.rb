require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource

  property :id,             Serial
  property :first_name,     String
  property :surname,        String
  property :email,      String, required: true, format: :email_address, unique: true,
    messages: {
      presence: "Email is mandatory",
      format: "Please enter a correct email address",
      is_unique: "This email is already in use"
    }
  property :password_digest, BCryptHash

  has n, :spaces, through: Resource

  attr_reader :password
  attr_accessor :password_confirmation
end
