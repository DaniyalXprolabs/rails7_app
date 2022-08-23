# frozen_string_literal: true

class UsersController < ApplicationController
  def profile
    @user = User.find(params[:user_id])
  end
end
