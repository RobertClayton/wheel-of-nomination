class Team < ApplicationRecord
  has_many :users

  def find_by_name(name)
    Team.find_by(name: name.downcase.capitalize)
  end
end
