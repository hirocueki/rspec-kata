class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :projects
  has_many :notes

  def name
    [first_name, last_name].join(" ")
  end

end
