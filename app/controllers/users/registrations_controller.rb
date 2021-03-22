# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  protected

  def update_resource(resource, params)
    if params[:password].present? || params[:password_confirmation].present? || params[:current_password].present?
      resource.update_with_password(params)
    else
      resource.update_without_password(params.except(:current_password))
    end
  end

  def build_resource(hash = {})
    hash[:uid] = User.create_unique_string
    self.resource = resource_class.new_with_session(hash, session)
  end
end
