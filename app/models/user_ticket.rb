class UserTicket < ApplicationRecord
  belongs_to :user
  belongs_to :ticket
  validates :not_bougth_past
  validates :search_user_bougth
end

def not_bougth_past

	ev = Event.find_by_name(self.assigned_by_user)
	
	if ev.start_date < Date.today
		
		errors.add(:start_date, "can't be in the past")
	end
end

def search_user_bougth
  user = Userticket.where(paid: 'false')
  unless item.nil?
    errors.add(:name_found, "This username has already been taken")
  end
 end

