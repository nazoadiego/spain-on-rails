# frozen_string_literal: true

class Company < ApplicationRecord
  LOCATIONS = Companies::ListCompaniesLocationsUseCase.call

  has_many :comments, dependent: :destroy

  scope :by_province, ->(province) { where('location ILIKE :province', province: province) }

  validates :name, presence: true, uniqueness: true
  validates :location, inclusion: { in: LOCATIONS, message: '%<value> is not a valid Spanish location' }
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
