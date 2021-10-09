class Garden < ApplicationRecord
  belongs_to :user
  has_many :reservations

  LIST_OF_LAND = ['rocheux', 'argileux', 'sablonneux', 'terre agricole']

  validates :title, :price, :image, :description, :address, :land, presence: true
  validates :title, length: { minimum: 6, maximum: 25 }
  validates :description, length: { minimum: 25, maximum: 250 }
  validates :address, length: { minimum: 10, maximum: 70 }
  validates :price, numericality: { only_integer: true }
  #REGEX URL VALIDATION!!!
  validates :land, inclusion: { in: LIST_OF_LAND }

  has_one_attached :image

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end