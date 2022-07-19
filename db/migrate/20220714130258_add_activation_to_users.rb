# frozen_string_literal:true

# A class MIgration for account activation
class AddActivationToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :activation_digest, :string
    add_column :users, :activated, :boolean,default: false
    add_column :users, :activated_at, :datetime
  end
end
