class RoomScheduleSerializer < ActiveModel::Serializer
	attributes :id, :description, :starts_at, :ends_at

	belongs_to :user
	belongs_to :room
end
