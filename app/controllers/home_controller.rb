class HomeController < ApplicationController
  def top
     @userplans = Userplan.all
     @users = User.all
     @plans = Plan.all

    users_tmp = @userplans.pluck(:user_id)
    satisfied = @userplans.pluck(:satisfied)

    @chart = LazyHighCharts::HighChart.new("graph") do |c|
      c.title(style: {fontSize: '50px'}, text: "顧客別満足度")
      c.xAxis(categories: users_tmp,
        labels: {style: {fontSize: '20px'}})
      c.yAxis(title: {style: {fontSize: '50px'}, text: '満足度'},
        ceiling: 100,
        labels: {style: {fontSize: '30px'}})
      c.series(name:"ユーザーID", data: satisfied)
      c.chart(type: "column", height: 700)
      c.colors(['#FE9A2E'])
   end
  end

  def data
    @userplans = Userplan.all
    @users = User.all
    @plans = Plan.all
  end
end
