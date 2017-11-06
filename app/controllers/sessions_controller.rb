# frozen_string_literal: true

class SessionsController < ApplicationController
  def auth_failure
    flash[:error] = 'Não foi possível obter suas informações do twitter, precisamos dela para twittar em seu nome'
    redirect_to root_path
  end

  def create
    user = User.find_or_create_from_auth_hash(auth_hash)
    session[:user_id] = user.id

    flash[:success] = "Logado como #{user.username} com sucesso!"
    redirect_to root_path, success: "Logado como #{user.username} com sucesso!"
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = 'Deslogado com sucesso!'
    redirect_to root_path
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
