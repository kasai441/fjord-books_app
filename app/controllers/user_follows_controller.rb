# frozen_string_literal: true

class UserFollowsController < ApplicationController
  def create
    @user = User.find(params[:user_follow][:following_id])
    current_user.follow!(@user)
    redirect_to @user
  end

  def destroy
    @user = UserFollow.find(params[:id]).following
    current_user.unfollow!(@user)
    redirect_to @user
  end
end
