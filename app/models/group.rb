class Group < ApplicationRecord
  belongs_to :user

  has_many :groups_expenses, dependent: :destroy
  has_many :expenses, through: :groups_expenses
  has_one_attached :icon, dependent: :destroy

  # validates :icon, blob: { content_type: :image }
end
