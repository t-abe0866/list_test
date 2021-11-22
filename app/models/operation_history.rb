class OperationHistory < ApplicationRecord
  validates :grp_id, presence: true # グループID 必須
  validates :handle_id, presence: true # ハンドルID 必須
  validates :operation_datetime, presence: true # 日時 必須　
  validates :message_id, presence: true, uniqueness: true # 操作履歴メッセージID 必須　重複不可
  validates :operation_detail, presence: true # 操作履歴内容 必須
end
