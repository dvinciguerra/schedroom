class Room < ApplicationRecord

	# validations
	validates :name,
		presence: true, length: { in: 4..40 }

	# relationships
	has_many :room_schedules

end
