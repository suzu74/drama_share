class Like < ApplicationRecord
  belongs_to :user
  belongs_to :drama
  validates :user_id, {presence: true}
  validates :drama_id, {presence: true}
end
