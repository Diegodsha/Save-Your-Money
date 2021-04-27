# frozen_string_literal: true

class Expense < ApplicationRecord
  belongs_to :author, class_name: 'User' #:user

  has_many :groups_expenses, dependent: :destroy
  has_many :groups, through: :groups_expenses, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates :amount, presence: true, numericality: { less_than: 10_000 }

  scope :most_recent, -> { where('created_at DESC') }
end
