require 'rails_helper'

RSpec.describe 'RoomSchedules', type: :request do
  let(:room) do
    create :room
  end

  let(:current_user) do
    create :user
  end

  context 'POST /v1/room-schedules' do
    before do
      post api_v1_room_schedule_index_path,
           params: { schedule: attributes_for(:room_schedule) },
           headers: auth_headers(current_user)
    end

    it 'return 200 status code' do
      expect(response).to have_http_status(201)
    end
  end

  context 'GET /v1/room-schedules' do
    before do
      create_list :room_schedule, 10, user: current_user, room: room
    end

    before do
      get api_v1_room_schedule_index_path,
          headers: auth_headers(current_user)
    end

    it 'return 200 status code' do
      expect(response).to have_http_status(200)
    end

    it 'returns a list of 10 items' do
      expect(JSON.parse(response.body).size).to be(10)
    end
  end

  context 'GET /v1/room-schedules/:id' do
    let(:room_schedule) do
      create :room_schedule, user: current_user, room: room
    end

    before do
      get api_v1_room_schedule_path(room_schedule),
          headers: auth_headers(current_user)
    end

    it 'returns 200 status code' do
      expect(response).to have_http_status(200)
    end

    it 'returns 404 status code' do
      get '/api/v1/room-schedules/0', headers: auth_headers(current_user)
      expect(response).to have_http_status(404)
    end
  end

  context 'DELETE /v1/room-schedules/:id' do
    let(:room_schedule) do
      create :room_schedule, user: current_user, room: room
    end

    before do
      delete api_v1_room_schedule_path(room_schedule),
             headers: auth_headers(current_user)
    end

    it 'returns 200 status code' do
      expect(response).to have_http_status(200)
    end

  end
end
