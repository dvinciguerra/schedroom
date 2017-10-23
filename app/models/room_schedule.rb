class RoomSchedule < ApplicationRecord

	# validations
	validates :starts_at,
		presence: true

	validates :ends_at,
		presence: true

	# relationships
	belongs_to :user
	belongs_to :room

	has_one :user
	has_one :room
end
