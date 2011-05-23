class JoinTheDestructionController < ApplicationController

  def callback
    auth_hash = request.env['omniauth.auth']

    Voter.create_from_twitter_hash(auth_hash)

    redirect_to root_path
  end

  def failure
    raise request.env.inspect
  end

end