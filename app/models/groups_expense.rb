class GroupsExpense < ApplicationRecord

  #after_create :set_default

  belongs_to :group
  belongs_to :expense

  # def set_default
  #   self.group_id = 0
  #   puts 'hello'
  # end
  
end
