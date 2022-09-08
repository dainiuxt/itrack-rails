class Project < ApplicationRecord
  has_many :items, :dependent => :delete_all
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 10 }
end
