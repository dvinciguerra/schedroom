class API::V1::RoomScheduleController < API::V1::ApplicationController
	before_action :set_schedule, only: [:show, :update, :destroy]

  def index
		@schedule_list = RoomSchedule.all
		render json: @schedule_list, status: 200
  end

  def show
		render json: @schedule, status: 200
  end

  def create
		render json: {message: 'schedule_updated'}, status: 201
  end

  def update
		render json: {message: 'schedule_updated'}, status: 200
  end

  def destroy
		render json: {message: 'schedule_removed'}, status: 200
  end

	private
	def set_schedule
		@schedule = RoomSchedule.find(params[:id])
	end

	def schedule_params
		params.require(:schedule).permit(:description, :starts_at, :ends_at)
	end
end
