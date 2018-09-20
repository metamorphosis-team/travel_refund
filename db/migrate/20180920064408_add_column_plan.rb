class AddColumnPlan < ActiveRecord::Migration[5.2]
  def change
    add_column :plans, :plan_date, :date
  end
end
