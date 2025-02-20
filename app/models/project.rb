class Project < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  STATUSES = %w[Pending In\ Progress Review Completed Archived].freeze
  validates :status, inclusion: { in: STATUSES }
  validates :name, presence: true
end
