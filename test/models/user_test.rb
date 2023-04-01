# frozen_string_literal = true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  it 'expect password to be a string' do
    expect(user.password).to be_an_instance_of(String)
  end
end
