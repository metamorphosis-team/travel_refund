class HomeController < ApplicationController
  def top
     @userplans = Userplan.all
     @users = User.all
     @plans = Plan.all

    users_tmp = @userplans.pluck(:user_id)
    satisfied = @userplans.pluck(:satisfied)

    @chart = LazyHighCharts::HighChart.new("graph") do |c|
      c.title(text: "satisfied graph")
      # X軸の名称を設定 '月'
      c.xAxis(categories: users_tmp, title: {text: '人'})
      # Y軸の名称を設定 '円'
      c.yAxis(title: {text: '満足度'})
      c.series(name: "A", data: satisfied)
      # 判例を右側に配置
      @debug = "Ok"
     c.legend(align: 'right', verticalAlign: 'top',
       x: 0, y: 100, layout: 'vertical')
     # グラフの種類を「折れ線グラフ」から「棒グラフ」に変更
     c.chart(type: "column")
   end
  end
end
