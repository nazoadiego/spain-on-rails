# frozen_string_literal: true

class ButtonComponent < ViewComponent::Base
  attr_reader :url, :btn_class, :destroy_action

  BUTTON_TYPES_CLASSES = {
    primary: 'btn-primary',
    secondary: 'btn-secondary',
    accent: 'btn-accent',
    ghost: 'btn-ghost',
    error: 'btn-error',
    link: 'btn-link'
  }

  def initialize(url:, type: nil, method: :none, html_options: {})
    @url = url
    @type = type
    @method = method
    @html_options = html_options
  end

  def btn_class
    ['btn', BUTTON_TYPES_CLASSES[@type], @html_options[:class]].compact.join(' ')
  end

  def destroy_action
    @method == :delete
  end
end
