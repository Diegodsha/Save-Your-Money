# frozen_string_literal: true

class Group < ApplicationRecord
  belongs_to :user

  has_many :groups_expenses, dependent: :destroy
  has_many :expenses, through: :groups_expenses, dependent: :destroy
  has_one_attached :icon, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3, maximum: 15 }

  after_create :add_default_cover

  private

  def add_default_cover
    return if icon.attached?
      icon.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'bkcode7.jpg')),
                  filename: 'bkcode7.jpg', content_type: 'image/jpg')
    end
  end
end
