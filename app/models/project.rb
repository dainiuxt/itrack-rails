class Project < ApplicationRecord
  has_many :items
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 10 }
end
