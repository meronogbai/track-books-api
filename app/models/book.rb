class Book < ApplicationRecord
  has_one :tracker
  has_one :user, through: :tracker

  validates :title, presence: true,
                    length: { minimum: 2, maximum: 50 }
  validates :total_chapters, presence: true,
                             numericality: {
                               only_integer: true,
                               greater_than: 0,
                               less_than: 1000
                             }
  validates :completed_chapters,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 0,
              less_than_or_equal_to: proc { |book| book.total_chapters }
            }
end
