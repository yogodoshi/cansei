# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'enum' do
    it { is_expected.to define_enum_for(:frequency).with({ off: 0, low: 1, medium: 2, high: 3 }) }
  end

  describe 'validations' do
    subject { build(:user) }

    [:provider, :uid, :username, :token, :secret, :profile_image, :frequency].each do |attr|
      it { is_expected.to validate_presence_of(attr) }
    end

    it { should validate_uniqueness_of(:uid).scoped_to(:provider) }
  end
end
