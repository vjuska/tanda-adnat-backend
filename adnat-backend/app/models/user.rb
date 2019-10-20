

class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not a valid email")
    end
  end
end

class UserValidator < ActiveModel::Validator
   def validate(record)
      print "here is my password" + record.password
      if record[:password] != record[:passwordConfirmation]
        record.errors[:base] << "The passwords do not match"
      end
   end
end

class User < ApplicationRecord
    validates :first_name, presence: true, length: {minimum: 2}
    validates :last_name, presence: true, length: {minimum: 2}
    validates :email_address, presence: true, email: true
    validates_with UserValidator
end