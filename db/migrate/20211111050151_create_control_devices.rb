class CreateControlDevices < ActiveRecord::Migration[6.1]
  def change
    create_table :control_devices do |t|

      t.bigint :control_device_id
      t.string :name, limit: 30
      t.string :physical_code, limit: 32
      t.text :memo

      t.timestamps
    end
  end
end
