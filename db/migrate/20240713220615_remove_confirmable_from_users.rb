class RemoveConfirmableFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :confirmation_token, :string
  end
end
