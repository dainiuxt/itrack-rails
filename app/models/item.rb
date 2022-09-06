class Item < ApplicationRecord
  belongs_to :project
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
