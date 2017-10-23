class API::V1::RoomScheduleController < API::V1::BaseController
  before_action :set_schedule, only: %i[show destroy]

  def index
    @schedule_list = RoomSchedule.find_by_week
    render json: @schedule_list, status: 200
  end

  def show
    render json: @schedule, status: 200
  end

  def create
    schedule = RoomSchedule.new(schedule_params)
    if schedule.save
      render json: schedule, status: 201
    else
      render json: schedule.errors, status: 400
    end
  end

  def destroy
    if @schedule.user_id != current_user.id
      render json: { message: 'operation_not_allowed' }, status: 405
    end

    if @schedule.destroy
      render json: { message: 'schedule_removed' }, status: 200
    else
      render json: { message: 'remove_error' }, status: 400
    end
  end

  private

  def set_schedule
    @schedule = RoomSchedule.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'resource_not_found' }, status: 404
  end

  def schedule_params
    defaults = { user: current_user, room: Room.first }
    params.require(:schedule)
          .permit(:description, :starts_at, :ends_at)
          .reverse_merge(defaults)
  end
end
