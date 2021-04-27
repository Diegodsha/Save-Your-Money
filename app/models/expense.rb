class Expense < ApplicationRecord
  
  after_update :create_group, if: :group_nil?

  belongs_to :user

  has_many :groups_expenses, dependent: :destroy
  has_many :groups, through: :groups_expenses, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3, maximum: 30 }
  validates :amount, presence: true, numericality: { less_than: 10_000 }

  scope :most_recent, -> { where('created_at DESC') }

def create_group
      group_id = :group_id
      GroupsExpense.create(group_id:group_id, expense_id:id) if group_id
end

def group_nil?
  groups.size.zero?
end


end
