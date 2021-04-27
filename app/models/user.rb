class User < ApplicationRecord
  has_many :expenses, dependent: :destroy
  has_many :groups, dependent: :destroy

  has_one_attached :avatar, dependent: :destroy

  validates :email, presence: true
  validates :name, presence: true, uniqueness: true

  after_commit :add_default_cover, on: %i[create update]

  private

  def add_default_cover
    return if avatar.attached?

      avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'horse.jpg')), filename: 'horse.jpg',
                    content_type: 'image/jpg')
  end
end
