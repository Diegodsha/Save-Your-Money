class Expense < ApplicationRecord
  belongs_to :user

  has_many :groups_expenses, dependent: :destroy
  has_many :groups, through: :groups_expenses

  validates :name, presence: true, length: { minimum: 3, maximum: 30 }
  validates :amount, presence: true, numericality: { less_than: 10_000 }
end
