class HomeController < ApplicationController
  def top
    @userplans = Userplan.all
    @users = User.all
    @plans = Plan.all
  end
end
