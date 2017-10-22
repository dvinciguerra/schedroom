class API::V1::BaseController < APIController
	include Knock::Authenticable
	
	# some defaults
	before_action :authenticate_user

end
