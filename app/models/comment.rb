class Comment < ApplicationRecord
  belongs_to :company, counter_cache: true
  belongs_to :user
  belongs_to :parent, class_name: 'Comment', optional: true
  has_many   :replies, class_name: 'Comment', foreign_key: :parent_id, dependent: :destroy

  validates :message, presence: true
  validates :title, presence: true

  scope :with_author, -> { includes([:user]) }

  def has_replies?
    replies.any?
  end

  def is_a_reply?
    parent_id.present?
  end
end
