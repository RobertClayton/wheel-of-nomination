class Nomination < ApplicationRecord
  belongs_to :user

  def formatted_date
    date.strftime("%a %d %b")
  end
end
