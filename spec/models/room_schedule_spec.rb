require 'rails_helper'

RSpec.describe RoomSchedule, type: :model do

	let(:current_user) do
		create :usrer
	end

	let(:room) do
		create :room
	end

	before do
		create_list :room_schedule, 5, user: current_user, room: room, starts_at: (Date.today - 10).strftime('%Y-%m-%d 10:00:00')
		create_list :room_schedule, 5, user: current_user, room: room, starts_at: Date.today.strftime('%Y-%m-%d 12:00:00')
	end

	it 'returns only five dates' do
		list = RoomSchedule.find_by_week
		expect(list.size).to be(5)
	end 
end
