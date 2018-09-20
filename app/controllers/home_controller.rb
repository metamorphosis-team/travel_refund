class HomeController < ApplicationController
  def top
    @userplans = Userplan.all
    @users = User.all
    @plans = Plans.all
  end
end
