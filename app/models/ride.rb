class Ride < ApplicationRecord
    belongs_to :user
    belongs_to :attraction

    def take_ride
        if ticket_check && height_check
            sorry_tickets + " " + sorry_height
        elsif height_check
           "Sorry. "+ sorry_height
        elsif ticket_check
            sorry_tickets
        else 
            user.tickets = user.tickets - attraction.tickets
            user.nausea =  user.nausea + attraction.nausea_rating
            user.happiness = user.happiness + attraction.happiness_rating
            self.user.save
            "Thanks for riding the #{attraction.name}!"
        end
    end

    def ticket_check
        self.user.tickets < self.attraction.tickets
    end

    def height_check
        self.user.height < self.attraction.min_height
    end

    def sorry_tickets
        "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    end
    
    def sorry_height
        "You are not tall enough to ride the #{self.attraction.name}."
    end
    


  

   

   
end
