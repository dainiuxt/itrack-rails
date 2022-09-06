class Project < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 10 }
end
