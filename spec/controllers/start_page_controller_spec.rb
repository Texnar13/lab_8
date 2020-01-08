require 'rails_helper'


RSpec.describe StartPageController, type: :controller do
  context 'app behaviour if user not register' do
    it 'should redirect to signin page if user do not auth' do
      get  :index
      expect(response).to redirect_to('/login')
      expect(response).to have_http_status(302)
    end
  end

end
