# frozen_string_literal: true

class TwitterService
  def initialize(user)
    @user = user
    @client = Twitter::REST::Client.new(@user.twitter_access)
  end

  def tweet_to_the_company
    @client.update(random_complain_message)
  rescue Twitter::Error::Unauthorized => exception # invalid or expired twitter token
    # do nothing for now
  rescue Twitter::Error::Forbidden => exception
    # do nothing for now
  end

  private

  def random_complain_message
    if Random.new.rand(1..7) == 1
      share_service_message
    else
      Settings.tweet_messages.sample
    end
  end

  def share_service_message
    "Também está de saco cheio do mau serviço prestado pela empresa #{Settings.company_name}? Junte sua voz a nossa: #{Settings.site_url}"
  end
end
