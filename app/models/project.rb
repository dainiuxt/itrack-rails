class Project < ApplicationRecord
  include Visible

  has_many :items, :dependent => :destroy
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 10 }

  VALID_STATUSES = ['active', 'closed', 'archived']

  validates :status, inclusion: { in: VALID_STATUSES }

  def archived?
    status == 'archived'
  end
end