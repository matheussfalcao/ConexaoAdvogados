class AddRemainingFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :cpf, :string
    add_column :users, :oab, :string
    add_column :users, :sex, :string
    add_column :users, :birth_date, :date
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :phone, :string
  end
end
