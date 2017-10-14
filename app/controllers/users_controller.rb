# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :check_for_authentication, except: :new

  def new
    redirect_to edit_user_path if current_user
  end

  def edit
    @user = current_user
  end

  private

  def check_for_authentication
    redirect_to root_path unless current_user
  end
end
