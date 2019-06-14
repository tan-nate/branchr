class CreateMashes < ActiveRecord::Migration
  def change
    create_table :mashes do |t|
      t.string :name
      t.references :whole, index: true
    end
  end
end
