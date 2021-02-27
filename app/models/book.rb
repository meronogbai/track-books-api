class Book < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
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
              less_than: 1000
            }
end
