# frozen_string_literal: true

class DropdownFilterComponent < ViewComponent::Base
  def initialize(options:, selected_option:, placeholder: nil)
    @options = options
    @selected_option = selected_option
    @placeholder = placeholder || 'Please select an option'
  end

  def no_filter?
    @selected_option.nil?
  end

  def display_options
    @options.map { |option| { value: snakecase(option), display: option }}
  end

  def selected_option?(option)
    @selected_option == option[:value]
  end

  def snakecase(string)
    string.gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2')
          .gsub(/([a-z\d])([A-Z])/,'\1_\2')
          .tr('-', '_')
          .gsub(/\s/, '_')
          .gsub(/__+/, '_')
          .downcase
  end
end
