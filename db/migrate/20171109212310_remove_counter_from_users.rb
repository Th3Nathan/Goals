class RemoveCounterFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :counter
  end
end
