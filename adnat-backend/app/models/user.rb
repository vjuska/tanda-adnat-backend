
require 'bcrypt'

class EmailValidator < ActiveModel::EachValidator

  include BCrypt

  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not a valid email")
    end
  end
end

class UserValidator < ActiveModel::Validator
   def validate(record)
      # password hashing
        @password = BCrypt::Password.create(record[:password])
        record[:password] = @password
   end
end

class User < ApplicationRecord
    has_secure_password
    validates :first_name, presence: true, length: {minimum: 2}
    validates :last_name, presence: true, length: {minimum: 2}
    validates :email, presence: true, email: true
    validates_confirmation_of :password,:password_confirmation, message: "The passwords do not match"
    # validates_presence_of :password_confirmation, :if => :password_changed?
    validates_with UserValidator
end