class Note < ApplicationRecord
  belongs_to :project
  belongs_to :user

  # note.user.name => note.user_name
  delegate :name, to: :user, prefix: true

  scope :search, ->(term) {
    where("message LIKE ?", "%#{term}%")
  }
end
