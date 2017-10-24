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

  describe '#twitter_access' do
    let!(:user) { build(:user) }
    let!(:user_access_hash) do
      {
        consumer_key: ENV['TWITTER_API_KEY'],
        consumer_secret: ENV['TWITTER_API_SECRET'],
        access_token: user.token,
        access_token_secret: user.secret
      }
    end

    it 'returns a hash with correct keys and values' do
      expect(user.twitter_access).to eq(user_access_hash)
    end
  end

  describe '.find_or_create_from_auth_hash' do
    subject { described_class.find_or_create_from_auth_hash(OmniAuth.config.mock_auth[:twitter]) }

    context 'when the User doesnt exist in the database' do
      let(:created_user) { described_class.last }

      it 'creates the User with correct attributes' do
        expect do
          subject
        end.to change { described_class.count }.by(1)

        expect(created_user.provider).to eq('twitter')
        expect(created_user.uid).to eq('bathjJwvdhKjgfgh8Jd745J7dh5Qkgflbnczd65dfnw')
        expect(created_user.token).to eq('1234')
        expect(created_user.secret).to eq('5678')
        expect(created_user.username).to eq('yogodoshi')
        expect(created_user.profile_image).to eq('http://si0.twimg.com/sticky/default_profile_images/default_profile_2_normal.png')
      end

      it 'returns the created user' do
        expect(subject).to eq(created_user)
      end
    end

    context 'when the User already exists in the database' do
      let!(:user) { create(:user, :from_mocked_twitter_auth, profile_image: 'http://another_url.com/avatar.jpg', username: 'not_yogodoshi') }

      it 'updates the User with given attributes' do
        expect do
          subject
        end.to_not change { described_class.count }

        user.reload

        expect(user.provider).to eq('twitter')
        expect(user.uid).to eq('bathjJwvdhKjgfgh8Jd745J7dh5Qkgflbnczd65dfnw')
        expect(user.token).to eq('1234')
        expect(user.secret).to eq('5678')
        expect(user.username).to eq('yogodoshi')
        expect(user.profile_image).to eq('http://si0.twimg.com/sticky/default_profile_images/default_profile_2_normal.png')
      end

      it 'returns the found user' do
        expect(subject).to eq(user)
      end
    end
  end

  describe '.frequency_options_for_select' do
    subject { described_class.frequency_options_for_select }

    it 'returns an array of arrays with options for a "select" tag' do
      expect(subject).to eq([['Darei uma pausa nas reclamações', 'off'], ['Um pouco (1 tweet por semana)', 'low'], ['Muito insatisfeito (1 tweet por dia)', 'medium'], ['Cansado de ser maltratado (1 tweet por hora)', 'high']])
    end
  end
end
