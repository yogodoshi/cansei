# frozen_string_literal: true

def sign_in(user)
  session[:user_id] = user.id
end
