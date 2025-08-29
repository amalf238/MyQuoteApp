class User < ApplicationRecord
    has_secure_password # method to secure password using BCrypt
    has_many :quotes, dependent: :destroy  # Create a one-to-many relationship with quotes, destroy ensures that if a user is destroyed their associated quotes are also deleted

    def full_name   # To get the the user's full name by concatenating the fname and lname fields
        "#{fname} #{lname}".strip
    end
end
