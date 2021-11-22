class CreateControlDevices < ActiveRecord::Migration[6.1]
  def change
    create_table :control_devices do |t|
      t.bigint :control_device_id, null: false
      t.string :name, limit: 30, null: false
      t.string :physical_code, limit: 32, null: false
      t.boolean :is_gateway, null: false
      t.string :schema_id, limit: 6
      t.text :memo

      t.timestamps
    end
  end
end
