# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TwitterService do
  describe '#tweet_to_the_company' do
    let!(:user) { build(:user) }
    let!(:twitter_client_double) { double('Twitter::REST::Client') }

    subject { described_class.new(user).tweet_to_the_company }

    before do
      allow(Twitter::REST::Client).to receive(:new).with(user.twitter_access).and_return(twitter_client_double)
    end

    context 'success' do
      it 'sends a tweet with one of the random messages' do
        expect(twitter_client_double).to receive(:update).with(kind_of(String)).and_return(true)
        subject
      end
    end

    context 'when it raises a Twitter::Error::Unauthorized exception' do
      before { allow(twitter_client_double).to receive(:update).with(kind_of(String)).and_raise(Twitter::Error::Unauthorized) }

      it 'doesnt raise an error' do
        expect do
          subject
        end.to_not raise_error
      end
    end

    context 'when it raises a Twitter::Error::Forbidden exception' do
      before { allow(twitter_client_double).to receive(:update).with(kind_of(String)).and_raise(Twitter::Error::Forbidden) }

      it 'doesnt raise an error' do
        expect do
          subject
        end.to_not raise_error
      end
    end
  end
end
