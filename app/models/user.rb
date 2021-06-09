class User < ApplicationRecord
  validates :name, presence: true
  validates :score, presence: true
  # validates :team_id, presence: true

  belongs_to :team
  has_many :nominations

  def find_by_name(name)
    User.find_by(name: name)
  end
end
