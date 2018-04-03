class Event < ApplicationRecord
  belongs_to :place
  has_many :tickets
  validate :date_cannot_be_in_the_past
  validate :not_two_places
end


def date_cannot_be_in_the_past
	puts start_date
	puts Date.today
	if start_date < Date.today
		puts "Hola"
		errors.add(:start_date, "can't be in the past")
	end
end


def not_two_places
	if !place.new_record? && !start_date.new_record?  
		errors.add(:place, "can't be in the same place at the same time")
	end

end 
