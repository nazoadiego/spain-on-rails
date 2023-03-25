# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def parse_yaml(file)
    YAML.safe_load(File.open(file))
  end
end
