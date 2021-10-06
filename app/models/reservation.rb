class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :garden

  validates :date_end, :date_start, presence: true
  validates :date_end, date: { after_or_equal_to: :date_start }
  validates :date_start, date: { after_or_equal_to: DateTime.now }
end
