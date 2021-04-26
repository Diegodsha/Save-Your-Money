class ChangeGroupsExpenseUserIdNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :groups_expenses, :group_id, true
  end
end
