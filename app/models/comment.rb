class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :writable, polymorphic: true
end
