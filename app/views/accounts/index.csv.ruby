bom = "\uFEFF"
CSV.generate(bom) do |csv|
  csv_column_names = ["アカウントID", "アカウントコード", "メールアドレス", "パスワード", "姓", "名", "かな姓", "かな名", "生年月日", "有効開始日", "終了日", "有効フラグ", "メモ", "作成日", "最終更新日"]
  csv << csv_column_names
  @accounts_all = Account.all
  @accounts_all.each do |account|
    csv_column_values = [
      account.account_id,
      account.account_code,
      account.mail_address,
      account.password_digest,
      account.family_name,
      account.first_name,
      account.kana_family_name,
      account.kana_first_name,
      account.birth,
      account.valid_start_date,
      account.valid_end_date,
      account.is_valid,
      account.memo,
      account.created_at,
      account.updated_at
    ]
    csv << csv_column_values
  end
end
