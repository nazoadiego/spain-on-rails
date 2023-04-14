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

  def selected_option?(option)
    @selected_option == option.underscore
  end
end
