# frozen_string_literal: true

class Company < ApplicationRecord
  VALID_LOCATIONS = YAML.safe_load(File.open("#{Rails.root}/db/data/provinces.yml"))

  validates :name, presence: true, uniqueness: true
  validates :location, inclusion: { in: VALID_LOCATIONS, message: '%<value> is not a valid Spanish location' }
end
