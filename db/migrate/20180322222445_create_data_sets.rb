class CreateDataSets < ActiveRecord::Migration[5.2]
  def change
    create_table :data_sets do |t|
      t.string :name
      t.string :uid
      t.references :user, foreign_key: true
      t.text :description

      t.timestamps
    end
    add_index :data_sets, :uid, unique: true
    add_index :data_sets, :name, unique: true
  end
end
