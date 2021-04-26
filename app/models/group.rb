class Group < ApplicationRecord
  belongs_to :user

  has_many :groups_expenses, dependent: :destroy
  has_many :expenses, through: :groups_expenses, dependent: :destroy
  has_one_attached :icon, dependent: :destroy

  # validates :icon, blob: { content_type: :image }

  private
 def add_default_cover
  unless avatar.attached?
    self.avatar.attach(io: File.open(Rails.root.join("app", "assets", "images", "bkcode7.jpg")), filename: 'bkcode7.jpg' , content_type: "image/jpg")
  end
end
end
