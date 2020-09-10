class RelationshipRenameColumn < ActiveRecord::Migration[5.2]
  def change
  	rename_column :relationships, :following_ig, :following_id
  end
end
