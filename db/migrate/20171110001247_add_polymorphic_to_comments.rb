class AddPolymorphicToComments < ActiveRecord::Migration
  def change
    remove_column :comments, :commentable_id
    add_reference :comments, :commentable, polymorphic: true, index: true
  end
end
