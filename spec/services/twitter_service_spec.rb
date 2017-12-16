# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TwitterService do
  describe '#tweet_a_complaint' do
    let!(:user) { build(:user) }
    let!(:twitter_client_double) { double('Twitter::REST::Client') }

    subject { described_class.new(user).tweet_a_complaint }

    before do
      allow(Twitter::REST::Client).to receive(:new).with(user.twitter_access).and_return(twitter_client_double)
    end

    context 'success' do
      context 'when random returns any number other than 1' do
        before { expect_any_instance_of(Random).to receive(:rand).and_return(2) }

        it 'sends a tweet with one of the random messages' do
          expect(twitter_client_double).to receive(:update).with(kind_of(String)).and_return(true)
          subject
        end
      end

      context 'when random returns 1' do
        before { expect_any_instance_of(Random).to receive(:rand).and_return(1) }

        it 'sends a tweet with the message that shares the app url' do
          expect(twitter_client_double).to receive(:update).with("Também está de saco cheio do mau serviço prestado pela empresa #{Settings.company_name}? Junte sua voz a nossa: #{Settings.site_url}").and_return(true)
          subject
        end
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
