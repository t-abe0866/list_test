class ControlDevice < ApplicationRecord
  validates :control_device_id, presence: true, uniqueness: true # 制御機器ID 必須　重複不可
  validates :name, presence: true, length: {maximum: 30} # 機器名 必須　文字数30
  validates :physical_code, presence: true, length: {maximum: 32} # 制御機器物理コード 必須　文字数32
  validates :is_gateway, inclusion: {in: [true, false]} # ゲートウェイフラグ 必須　文字数16
  validates :schema_id, presence: true, length: {maximum: 6} # スキーマID 必須　文字数16
end
