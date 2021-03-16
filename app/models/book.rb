# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :comments, as: :writable, dependent: :destroy
  mount_uploader :picture, PictureUploader
end
