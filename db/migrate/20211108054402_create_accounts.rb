class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|

      t.bigint :account_id
      t.string :account_code, limit: 32
      t.string :mail_address, limit: 129
      t.string :password, limit: 60
      t.string :family_name, limit: 16
      t.string :first_name, limit: 16
      t.string :kana_family_name, limit: 16
      t.string :kana_first_name, limit: 16
      t.string :birth_year, limit: 4
      t.string :birth_month, limit: 4
      t.string :birth_day, limit: 4
      t.date :valid_start_date
      t.date :valid_end_date
      t.boolean :is_valid
      t.text :memo
      t.date :created_date
      t.date :last_updated

      t.timestamps
    end
  end
end
