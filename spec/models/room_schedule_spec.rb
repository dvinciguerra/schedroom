require 'rails_helper'

RSpec.describe RoomSchedule, type: :model do

	let(:current_user) do
		create :user
	end

	let(:room) do
		create :room
	end

	let(:monday) do
		dt = Date.today
		Date.commercial(dt.year, dt.cweek, 1)
	end

	before do
		create :room_schedule, user: current_user, room: room, starts_at: (Date.today - 10).strftime('%Y-%m-%d 10:00:00')
		(0..4).each do |num|  
			create :room_schedule, user: current_user, room: room, starts_at: (monday + num).strftime('%Y-%m-%d 12:00:00')
		end
	end

	it 'returns only five dates' do
		list = RoomSchedule.find_by_week
		expect(list.size).to be(5)
	end 
end
