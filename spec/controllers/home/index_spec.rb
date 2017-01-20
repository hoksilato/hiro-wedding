require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET #index' do
    it 'should render template' do
      xhr :get, :index, format: :js
      expect(response).to render_template(:index)
    end

    it 'return new model' do
      xhr :get, :index, format: :js
      expect(assigns(:result).visitor.class).to eq(Visitor)
      expect(assigns(:result).visitor.new_record?).to eq(true)
    end
  end
end
