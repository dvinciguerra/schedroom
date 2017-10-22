require 'rails_helper'

RSpec.describe 'UserProfiles', type: :request do

	let(:current_user){
		FactoryGirl.create(:user)
	}

  describe 'GET /v1/user-profile' do
		before do
			get api_v1_user_profile_url, headers: auth_headers(current_user)
		end

    it { expect(response).to have_http_status(200) }
  end
end
