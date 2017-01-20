require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  let(:visitor) { create(:visitor) }

  describe 'PUT #create' do
    it 'should create visitor' do
      xhr :post, :create, code: visitor.code, visitor: {num: 2}, format: :js
      expect(assigns(:result).visitor.num).to eq(2)
      expect(assigns(:result).message).to eq('RSVP successfully!')
    end

    it 'should show error message when code is blank' do
      xhr :post, :create, code: visitor.code, visitor: {code: ''}, format: :js
      expect(assigns(:result).visitor.errors.full_messages).to include("Code can't be blank")
    end

    it 'should show error message when number of attending is blank' do
      xhr :post, :create, code: visitor.code, visitor: {num: nil}, format: :js
      expect(assigns(:result).visitor.errors.full_messages).to include("Num can't be blank")
    end
  end
end
