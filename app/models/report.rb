class Report < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :writable, dependent: :destroy
end
