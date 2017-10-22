class API::V1::UserProfileController < API::V1::BaseController
  def index
    if current_user
      render json: current_user, status: 200
    else
      render json: { error: 'user_unauthenticated' }, status: 401
    end
  end
end
