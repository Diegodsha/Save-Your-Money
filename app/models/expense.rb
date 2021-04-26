class Expense < ApplicationRecord
  
  # after_create :create_group_expense

  belongs_to :user

  has_many :groups_expenses, dependent: :destroy
  has_many :groups, through: :groups_expenses, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3, maximum: 30 }
  validates :amount, presence: true, numericality: { less_than: 10_000 }

  scope :most_recent, -> { where('created_at < ?', Time.now) }

# def create_group_expense
#   #group_id = [self][:group_ids]
  
#   self.groups_expenses.create(group_id:group_ids, expense_id:id)
  
# end






end
