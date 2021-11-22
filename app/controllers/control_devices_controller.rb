class ControlDevicesController < ApplicationController
  helper_method :sort_column, :sort_direction

  # 制御機器の一覧を返す。
  # @return [Object] @control_devices
  def index
    # 初回表示時には初期値の代入し、検索やソートを行った場合はパラメータを代入
    @sort_item = params[:sort_item] || "control_device_id"
    @sort_order = params[:sort_order] || "asc"
    @display_result = params[:display_result] || 50

    # @control_devicesに制御機器一覧画面で表示する値を代入
    @control_devices = if params[:search]
      ControlDevice.order("#{sort_column} #{sort_direction}")
        .where("cast(control_device_id as text) LIKE ? OR name LIKE ? OR physical_code LIKE ? OR memo LIKE ? ",
          "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%").page(params[:page]).per(@display_result)
    else
      ControlDevice.order("#{sort_column} #{sort_direction}").page(params[:page]).per(@display_result)
    end

    # CSVダウンロード処理
    respond_to do |format|
      format.html
      format.csv do
        filename = "制御機器一覧.csv" # ファイル名指定
        send_data render_to_string, filename: filename, type: :csv
      end
    end
  end

  # 参照する制御機器情報を返す。
  # @return [Object] @control_device
  def show
    @control_device = ControlDevice.find(params[:id])
  end

  # 制御機器を新規作成して返す。
  # @return [Object] @control_device
  def new
    @control_device = ControlDevice.new
  end

  # 新規作成の制御機器を保存する。
  def create
    @control_device = ControlDevice.new(control_device_params)
    # 制御機器IDは１から連番。最大値を取得して代入？
    @control_device.control_device_id = if ControlDevice.maximum(:control_device_id).nil?
      1
    else
      ControlDevice.maximum(:control_device_id) + 1
    end
    # control_device_paramsから制御機器を新規作成する
    if @control_device.save
      # 操作履歴の保存　※grp_id,handle_idは仮
      save_history(1, 1, "制御機器を登録しました")
      flash[:success] = "制御機器は正常に新規作成されました"
      redirect_to new_control_device_path
    else
      render :new
    end
  end

  # 編集する制御機器の情報を返す。
  # @return [Object] @control_device
  def edit
    @control_device = ControlDevice.find(params[:id])
  end

  # 制御機器情報を更新する。
  def update
    @control_device = ControlDevice.find(params[:id])

    if @control_device.update(control_device_params)
      # 操作履歴の保存　※grp_id,handle_idは仮
      save_history(1, 1, "制御機器を編集しました")
      flash[:success] = "制御機器は正常に更新されました"
      redirect_to edit_control_device_path
    else
      render :edit
    end
  end

  # 制御機器を削除する。
  def destroy
    @control_device = ControlDevice.find(params[:id])
    @control_device.destroy

    # 操作履歴の保存　※grp_id,handle_idは仮
    save_history(1, 1, "制御機器を削除しました")
    flash[:success] = "制御機器は正常に削除されました"
    redirect_to control_devices_url
  end

  private

  # 指定したパスワードで認証を行う。
  # @return [Object] @control_devices 制御機器一覧画面で表示するリスト
  def control_device_params
    params.require(:control_device).permit(:control_device_id, :name, :physical_code, :is_gateway, :schema_id, :memo)
  end

  # 指定したパスワードで認証を行う。
  # @return [Object] @control_devices 制御機器一覧画面で表示するリスト
  def sort_direction
    %w[asc desc].include?(params[:sort_item]) ? params[:sort_item] : @sort_order
  end

  # 指定したパスワードで認証を行う。
  # @return [Object] @control_devices 制御機器一覧画面で表示するリスト
  def sort_column
    ControlDevice.column_names.include?(params[:sort]) ? params[:sort] : @sort_item
  end
end
