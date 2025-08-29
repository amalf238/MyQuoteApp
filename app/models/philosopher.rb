class Philosopher < ApplicationRecord
    has_many :quotes, dependent: :destroy
    
# method to display the philosopher full name
    def full_name
        "#{fname} #{lname}".strip
      end
end
