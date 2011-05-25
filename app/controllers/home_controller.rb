class HomeController < ApplicationController

  def index
    @voters = Voter.order('created_at DESC').limit(14)
  end

end
