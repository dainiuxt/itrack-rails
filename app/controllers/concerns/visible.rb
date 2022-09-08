module Visible
  extend ActiveSupport::Concern

  class_methods do
    def open_count
      where(status: 'open').count
    end
  end

  VALID_STATUSES = ['open', 'in progress', 'resolved', 'active', 'closed', 'archived']

  included do
    validates :status, inclusion: { in: VALID_STATUSES }
  end

  def archived?
    status == 'archived'
  end
end