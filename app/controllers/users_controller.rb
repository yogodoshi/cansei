# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :check_for_authentication, except: :new

  def new
    redirect_to edit_user_path if current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update!(user_params)

    flash[:success] = 'Frequência atualizada com sucesso!'
    redirect_to edit_user_path
  end

  private

  def check_for_authentication
    redirect_to root_path unless current_user
  end

  def user_params
    params.require(:user).permit(:frequency)
  end
end
