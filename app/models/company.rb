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

  def valid_url?
    return true if UrlValidator.new(url: url).valid?

    self.errors.add(:url, "#{url} is not a valid url!")
  end
end
