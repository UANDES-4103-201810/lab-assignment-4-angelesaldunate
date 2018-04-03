class Ticket < ApplicationRecord
  belongs_to :event
  has_many :user_tickets
  has_many :users, through: :user_tickets
  validates :price, numericality: {greater_than: 0 }	
  validates :date_cannot_be_in_the_past	
 
end
def date_cannot_be_in_the_past

 	ev = Event.find_by_name(self.assigned_by_user)
  
	if ev.start_date < Date.today
		
		errors.add(:start_date, "can't be in the past")
	end
end

