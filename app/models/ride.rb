class Ride < ApplicationRecord
    belongs_to :user
    belongs_to :attraction

    def take_ride
        if too_poor && too_short
            sorry_tickets + " " + sorry_height
        elsif too_short
           "Sorry. "+ sorry_height
        elsif too_poor
            sorry_tickets
        else 
            user.tickets -= attraction.tickets
            user.nausea += attraction.nausea_rating
            user.happiness += attraction.happiness_rating
            self.user.save
            "Thanks for riding the #{attraction.name}!"
        end
    end

    def too_poor
        self.user.tickets < self.attraction.tickets
    end

    def too_short
        self.user.height < self.attraction.min_height
    end

    def sorry_tickets
        "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    end
    
    def sorry_height
        "You are not tall enough to ride the #{self.attraction.name}."
    end
    


  

   

   
end
