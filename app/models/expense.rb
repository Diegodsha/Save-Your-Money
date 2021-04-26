class Expense < ApplicationRecord
  
   #after_update :update_group #if: :group_id_nil?

  belongs_to :user

  has_many :groups_expenses, dependent: :destroy
  has_many :groups, through: :groups_expenses, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3, maximum: 30 }
  validates :amount, presence: true, numericality: { less_than: 10_000 }

  scope :most_recent, -> { where('created_at < ?', Time.now) }

# def update_group
#       group_id = params[:expense][:group_id]
#         GroupsExpense.create(group_id:group_id, expense_id:@expense.id) if group_id
#   self.group_ids = group_id
  
# end

end
