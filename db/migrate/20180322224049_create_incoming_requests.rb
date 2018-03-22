class CreateIncomingRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :incoming_requests do |t|
      t.references :data_set, foreign_key: true
      t.jsonb :payload
      t.string :uid

      t.timestamps
    end
    add_index :incoming_requests, :uid, unique: true
  end
end
