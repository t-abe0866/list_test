class Account < ApplicationRecord
  validates :account_id, presence: true, uniqueness: true # アカウントID 必須　重複不可
  validates :account_code, presence: true, length: {maximum: 32} # アカウントコード 必須　文字数32
  validates :mail_address, presence: true, length: {maximum: 129}, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i} # メールアドレス 必須　文字数129 フォーマット指定
  has_secure_password
  validates :password, presence: true, length: {maximum: 60}, confirmation: true # パスワード 必須　文字数60　確認照合 ハッシュ
  validates :family_name, presence: true, length: {maximum: 16} # 姓 必須　文字数16
  validates :first_name, presence: true, length: {maximum: 16} # 名 必須　文字数16
  validates :kana_family_name, length: {maximum: 16} # かな姓 必須　文字数16
  validates :kana_first_name, length: {maximum: 16} # かな名 必須　文字数16
  validates :birth, format: {with: /\A\d{4}-\d{2}-\d{2}\z/} # 生年月日 必須　文字数16
  validates :valid_start_date, format: {with: /\A\d{4}-\d{2}-\d{2}\z/} # 有効開始日 必須　文字数16
  validates :valid_end_date, format: {with: /\A\d{4}-\d{2}-\d{2}\z/} # 終了日 必須　文字数16
  validates :is_valid, inclusion: {in: [true, false]} # 有効フラグ 必須　文字数16
end
