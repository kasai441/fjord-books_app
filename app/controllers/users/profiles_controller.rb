# frozen_string_literal: true

class Users::ProfilesController < ApplicationController
  # GET /users
  def index
    @users = User.order(:id).page(params[:page]).per(10)
  end

  # GET /users/:id
  def show; end
end
