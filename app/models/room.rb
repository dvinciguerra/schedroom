class Room < ApplicationRecord

	# validations
	validates :name,
		presence: true

	has_many :room_schedules

end
