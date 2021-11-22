bom = "\uFEFF"
CSV.generate(bom) do |csv|
  csv_column_names = ["制御機器ID", "機器名", "制御機器物理コード", "ゲートウェイフラグ", "スキーマID", "メモ"]
  csv << csv_column_names
  @control_devices.each do |control_device|
    csv_column_values = [
      control_device.control_device_id,
      control_device.name,
      control_device.physical_code,
      control_device.is_gateway,
      control_device.schema_id,
      control_device.memo
    ]
    csv << csv_column_values
  end
end
