# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    user = User.find_or_create_from_auth_hash(auth_hash)
    session[:user_id] = user.id

    redirect_to root_path, success: "Logado como #{user.username} com sucesso!"
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
