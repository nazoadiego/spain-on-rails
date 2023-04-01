# frozen_string_literal: true

class Company < ApplicationRecord
  has_many :comments, dependent: :destroy

  VALID_LOCATIONS = YAML.safe_load(File.open("#{Rails.root}/db/data/provinces.yml"))

  validates :name, presence: true, uniqueness: true
  validates :location, inclusion: { in: VALID_LOCATIONS, message: '%<value> is not a valid Spanish location' }
  validate :valid_url?

  def has_comments?
    comments_count.positive?
  end

  private

  # Move this to a separate helper file.

  def valid_url?
    is_a_match = URI::DEFAULT_PARSER.make_regexp(%w[http https]).match?(self.url)

    self.errors.add(:url, "#{url} is not a valid url!") unless is_a_match
  end
end
