class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.bigint :account_id, null: false
      t.string :account_code, limit: 32
      t.string :mail_address, limit: 129, null: false
      t.string :password_digest, null: false
      t.string :family_name, limit: 16, null: false
      t.string :first_name, limit: 16, null: false
      t.string :kana_family_name, limit: 16
      t.string :kana_first_name, limit: 16
      t.date :birth
      t.date :valid_start_date
      t.date :valid_end_date
      t.boolean :is_valid, null: false
      t.text :memo
      t.timestamps
    end
  end
end
