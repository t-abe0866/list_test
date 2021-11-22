class CreateOperationHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :operation_histories do |t|
      t.bigint :grp_id, null: false
      t.bigint :handle_id, null: false
      t.timestamp :operation_datetime, null: false
      t.integer :message_id, null: false
      t.text :operation_detail, null: false

      t.timestamps
    end
  end
end
