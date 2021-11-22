class ApplicationController < ActionController::Base
  # DB保存時にどのデータを更新したかを、operation_historiesに履歴を保存
  #
  # @grp_id [Numeric] 更新したグループ
  # @handle_id [Numeric] 更新した人のハンドル
  # @operation_detail [string] 更新内容
  #
  def save_history(grp_id, handle_id, operation_detail)
    # アカウントIDは１から連番。最大値を取得して代入？
    @message_id = if OperationHistory.maximum(:message_id).nil?
      1
    else
      OperationHistory.maximum(:message_id) + 1
    end
    OperationHistory.create(grp_id: grp_id, handle_id: handle_id, operation_datetime: Time.now, message_id: @message_id, operation_detail: operation_detail)
  end
end
