module ExpensesHelper
  def display_icon(group, expense)
    return unless expense.groups.any?

    image_tag group.icon, alt: 'group-icon', class: 'group-img'
  end

  def total_expense(expenses)
    total = expenses.inject(0) { |acum, expense| acum + expense.amount }
    if total > 2000

      content_tag(:span, "$#{total} Time to save money", class: 'text-danger save-money')
    else
      "$#{total}"
    end
  end
end
