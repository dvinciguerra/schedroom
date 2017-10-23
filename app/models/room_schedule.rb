class RoomSchedule < ApplicationRecord

	# validations
	validates :starts_at,
		presence: true, uniqueness: true

	validates :ends_at,
		presence: true

	# relationships
	belongs_to :user
	belongs_to :room

	def self.find_by_week(week = nil)
		days = Schedroom::Date.days_of_week(week || Date.today.cweek)
		where('starts_at BETWEEN ? AND ?', days.first.to_datetime, (days.last + 1).to_datetime)
	end


end
