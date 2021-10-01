class Garden < ApplicationRecord
  belongs_to :user
  has_many :reservations

  LIST_OF_LAND = ['rocheux', 'argileux', 'sablonneux', 'terre agricole']

  validates :title, :price, :image, :description, :address, :land, presence: true
  validates :title, length: { minimum: 6, maximum: 25 }
  validates :description, length: { minimum: 25, maximum: 250 }
  validates :address, length: { minimum: 10, maximum: 70 }
  validates :price, numericality: { only_integer: true }
  
  validates :land, inclusion: { in: LIST_OF_LAND }
end