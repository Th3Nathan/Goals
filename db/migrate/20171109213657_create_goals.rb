class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :title, null: false  
      t.string :details 
      t.boolean :finished, default: false
      t.timestamps 
    end
  end
end
