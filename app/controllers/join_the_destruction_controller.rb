class JoinTheDestructionController < ApplicationController

  def callback
    auth_hash = request.env['omniauth.auth']

    voter = Voter.create_from_twitter_hash(auth_hash)

    send_pusher_notification(voter) if voter.recently_created?

    redirect_to root_path
  end

  def failure
    raise request.env.inspect
  end


  private

    def send_pusher_notification(voter)
      Pusher['destruction_votes'].trigger_async('vote', {
        :count => Voter.count,
        :last_voter => voter.as_json
      })
    end

end