class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def current_user
    self.user
  end

  def save_current_user
    current_user.save
  end

  def take_ride
    user_tickets = current_user.tickets
    user_height = current_user.height
    user_nausea = current_user.nausea
    user_happiness = current_user.happiness

    attraction_tickets =self.attraction.tickets
    attraction_height = self.attraction.min_height
    attraction_nausea = self.attraction.nausea_rating
    attraction_happiness = self.attraction.happiness_rating
    case 
      when user_height < attraction_height && user_tickets < attraction_tickets
        "Sorry. You do not have enough tickets the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
      when user_tickets < attraction_tickets
        "Sorry. You do not have enough tickets the #{attraction.name}."
      when user_height < attraction_height
        "Sorry. You are not tall enough to ride the #{attraction.name}."
      when user_height > attraction_height && user_tickets > attraction_tickets
        current_user.tickets =  user_tickets - attraction_tickets
        current_user.nausea = user_nausea + attraction_nausea
        current_user.happiness = user_happiness + attraction_happiness
        save_current_user
      end


  end
end
