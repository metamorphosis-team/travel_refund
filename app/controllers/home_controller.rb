class HomeController < ApplicationController
  def top
     @userplans = Userplan.all
     @users = User.all
     @plans = Plan.all

    users_tmp = @userplans.pluck(:user_id)
    satisfied = @userplans.pluck(:satisfied).sort.reverse

    @chart = LazyHighCharts::HighChart.new("graph") do |c|
      c.title(text: "satisfied graph")
      c.xAxis(categories: users_tmp)
      c.yAxis(title: {text: '満足度'},
       ceiling: 100)
      c.series(name: " ",data: satisfied)
      c.chart(type: "column")
   end
  end

  def data
    @userplans = Userplan.all
    @users = User.all
    @plans = Plan.all
  end
end
