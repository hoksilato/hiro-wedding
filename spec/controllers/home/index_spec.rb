require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET #index' do
    it 'should render template' do
      xhr :get, :index, format: :js
      expect(response).to render_template(:index)
    end
  end
end
