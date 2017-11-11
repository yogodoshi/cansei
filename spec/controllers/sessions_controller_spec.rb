# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'GET #auth_failure' do
    subject! { get :auth_failure }

    it 'redirects to root_path with an error message' do
      subject
      expect(flash[:error]).to eq('Não foi possível obter suas informações do twitter, precisamos dela para twittar em seu nome')
      expect(response).to redirect_to(root_path)
    end
  end

  describe 'GET #create' do
    let!(:params) { { 'oauth_token' => 'biVSlAAAAAAA2xQzAAABXxy0pKU', 'oauth_verifier' => 'p858cQzJ7ibg4L2v8qPE69OIjp3kJAKu', 'controller' => 'sessions', 'action' => 'create', 'provider' => 'twitter' } }

    subject { get :create, params: params }

    before { request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter] }

    context 'when the User had not registered before' do
      it 'creates the User' do
        expect do
          subject
        end.to change { User.count }.by(1)
      end

      it 'sets the session "user_id" to the created User id' do
        subject
        expect(session[:user_id]).to eq(User.last.id)
      end
    end

    context 'when the User was already registered' do
      let!(:user) { create(:user, :from_mocked_twitter_auth) }

      it 'doesnt create a User' do
        expect do
          subject
        end.to_not change { User.count }
      end

      it 'sets the session "user_id" to the found User id' do
        subject
        expect(session[:user_id]).to eq(user.id)
      end
    end
  end

  describe 'DELETE #destroy' do
    subject { delete :destroy }

    context 'when the user is logged in' do
      let!(:user) { create(:user) }

      before { sign_in user }

      it 'deletes the session' do
        expect do
          subject
        end.to change { session[:user_id] }.from(user.id).to(nil)
      end

      it 'redirects to #new with success flash message' do
        subject
        expect(flash[:success]).to eq('Deslogado com sucesso!')
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when the user is not logged in' do
      it 'deletes the session' do
        expect(session[:user_id]).to eq(nil)
      end

      it 'redirects to #new with success flash message' do
        subject
        expect(flash[:success]).to eq('Deslogado com sucesso!')
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
