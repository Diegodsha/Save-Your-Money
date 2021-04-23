module ExpensesHelper
    def display_icon(group)
          image_tag group.icon,alt:'group-icon' ,class: 'group-img'
      end
end
