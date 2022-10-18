class Issue < ApplicationRecord
  include Visible
  
  belongs_to :project
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  VALID_STATUSES = ['open', 'in progress', 'resolved', 'archived']

  validates :status, inclusion: { in: VALID_STATUSES }

  def archived?
    status == 'archived'
  end
end