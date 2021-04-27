# frozen_string_literal: true

module GroupsHelper
  def display_eye(expense)
    render 'eye' if current_user == expense.author
  end

  def display_modify(group)
    render 'modify' if current_user == group.user
  end
end
