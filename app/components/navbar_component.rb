# frozen_string_literal: true

class NavbarComponent < ViewComponent::Base
  include Devise::Controllers::Helpers

  def initialize(user:)
    @user = user
    @avatar_url = avatar_url
  end

  def avatar_url
    # TODO: Implement avatar_url, and a way to distinguish between guest and logged users
    # @user&.avatar_url.present? ? user.avatar_url : avatar_placeholder

    avatar_placeholder
  end

  def avatar_placeholder
    "https://daisyui.com/images/stock/photo-1534528741775-53994a69daeb.jpg"
  end
end
