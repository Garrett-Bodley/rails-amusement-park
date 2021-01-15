class User < ApplicationRecord
    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides
  
    # validates :name, uniqueness: true, presence: true
    # validates :height, presence: true
    # validates :happiness, presence: true
    # validates :tickets, presence: true


    def mood
        if nausea && happiness
            self.nausea > self.happiness ? "sad" : "happy" 
        end
    end
end
