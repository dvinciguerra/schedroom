class RoomSchedule < ApplicationRecord

	# validations
	validates :starts_at,
		presence: true

	validates :ends_at,
		presence: true

	# relationships
	belongs_to :user
	belongs_to :room

	def self.find_by_week(week = nil)
		days = Schedroom::Date.days_of_week(week || Date.today.cweek)
		where(starts_at: days.first..days.last)
	end


end
