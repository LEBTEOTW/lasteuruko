class Voter < ActiveRecord::Base

  after_create do
    @recently_created = true
  end

  class << self
    def create_from_twitter_hash(auth_hash)
      self.find_or_create_by_twitter_id(auth_hash['uid'], {
        :full_name      => auth_hash['user_info']['name'],
        :twitter_handle => auth_hash['user_info']['nickname'],
        :profile_image_url  => auth_hash['user_info']['image'],
        :oauth_token        => auth_hash['credentials']['token'],
        :oauth_token_secret => auth_hash['credentials']['secret']
      })
    end
  end

  def recently_created?
    !!@recently_created
  end

  def as_json
    {
      :full_name => self.full_name,
      :twitter_handle => self.twitter_handle,
      :profile_image_url => self.profile_image_url
    }
  end

end
