class AddUsersToNominations < ActiveRecord::Migration[6.0]
  def change
    add_reference :nominations, :user, index: true
  end
end
