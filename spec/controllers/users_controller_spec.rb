# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    subject { get :new }

    context 'when the user is not logged in' do
      it 'returns http success' do
        subject
        expect(response).to have_http_status(:success)
      end
    end

    context 'when the user is logged in' do
      let!(:user) { create(:user) }

      before { sign_in user }

      it 'redirects to #edit' do
        subject
        expect(response).to redirect_to(edit_user_path)
      end
    end
  end

  describe 'GET #edit' do
    subject { get :edit }

    context 'when the user is not logged in' do
      before do
        subject
      end

      it 'redirects to #new' do
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when the user is logged in' do
      let!(:user) { create(:user) }

      before do
        sign_in user
        subject
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'assigns @user to the logged in user' do
        expect(assigns(:user)).to eq(user)
      end
    end
  end
end
