class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.string :name
      t.integer :tree_id
      t.references :parent, index: true
    end
  end
end
