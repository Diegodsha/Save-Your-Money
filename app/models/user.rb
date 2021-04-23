class User < ApplicationRecord
    has_many :expenses, dependent: :destroy
    has_many :groups, dependent: :destroy
    
    has_one_attached :avatar, dependent: :destroy

    validates :email, presence: true
    validates :name, presence: true, uniqueness: true
   # validates :avatar, blob: { content_type: :image }

   after_commit :add_default_cover, on: [:create, :update]


private def add_default_cover
  unless avatar.attached?
    self.avatar.attach(io: File.open(Rails.root.join("app", "assets", "images", "bkcode7.jpg")), filename: 'bkcode7.jpg' , content_type: "image/jpg")
  end
end
end
