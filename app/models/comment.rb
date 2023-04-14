class Comment < ApplicationRecord
  belongs_to :company, counter_cache: true
  belongs_to :user

  validates :message, presence: true
  validates :title, presence: true
end
