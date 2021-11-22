class AccountsController < ApplicationController
  helper_method :sort_column, :sort_direction

  # アカウントの一覧を返す。
  # @return [Object] @accounts
  def index
    # 初回表示時には初期値の代入し、検索やソートを行った場合はパラメータを代入
    @sort_item = params[:sort_item] || "account_id"
    @sort_order = params[:sort_order] || "asc"
    @display_result = params[:display_result] || 50

    # @accountsにアカウント一覧画面で表示する値を代入
    @accounts = if params[:search]
      Account.order("#{sort_column} #{sort_direction}")
        .where("cast(account_id as text) LIKE ? OR account_code LIKE ? OR mail_address LIKE ? OR memo LIKE ? OR cast(created_at as text) LIKE ? OR cast(updated_at as text) LIKE ?",
          "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%").page(params[:page]).per(@display_result)
    else
      Account.order("#{sort_column} #{sort_direction}").page(params[:page]).per(@display_result)
    end

    # CSVダウンロード処理
    respond_to do |format|
      format.html
      format.csv do
        filename = "アカウント一覧.csv" # ファイル名指定
        send_data render_to_string, filename: filename, type: :csv
      end
    end
  end

  # 参照するアカウント情報を返す。
  # @return [Object] @account
  def show
    @account = Account.find(params[:id])
  end

  # アカウントを新規作成して返す。
  # @return [Object] @account
  def new
    @account = Account.new
  end

  # 新規作成のアカウントを保存する。
  def create
    @account = Account.new(account_params)
    # アカウントIDは１から連番。最大値を取得して代入？
    @account.account_id = if Account.maximum(:account_id).nil?
      1
    else
      Account.maximum(:account_id) + 1
    end
    # account_paramsからアカウントを新規作成する
    if @account.save
      # 操作履歴の保存　※grp_id,handle_idは仮
      save_history(1, 1, "アカウントを登録しました")
      flash[:success] = "アカウントは正常に新規作成されました"
      redirect_to new_account_path
    else
      render :new
    end
  end

  # 編集するアカウントの情報を返す。
  # @return [Object] @account
  def edit
    @account = Account.find(params[:id])
  end

  # アカウント情報を更新する。
  def update
    @account = Account.find(params[:id])
    if @account.update(account_params)
      # 操作履歴の保存　※grp_id,handle_idは仮
      save_history(1, 1, "アカウントを編集しました")
      flash[:success] = "アカウントは正常に更新されました"
      redirect_to edit_account_path
    else
      render :edit
    end
  end

  # アカウントを削除する。
  def destroy
    @account = Account.find(params[:id])
    @account.destroy

    # 操作履歴の保存　※grp_id,handle_idは仮
    save_history(1, 1, "アカウントを削除しました")
    flash[:success] = "アカウントは正常に削除されました"
    redirect_to accounts_url
  end

  private

  # 指定したパスワードで認証を行う。
  # @return [Object] @accounts アカウント一覧画面で表示するリスト
  def account_params
    params.require(:account).permit(:account_id, :account_code, :mail_address, :password, :password_confirmation, :family_name, :first_name, :kana_family_name, :kana_first_name, :birth, :valid_start_date, :valid_end_date, :is_valid, :memo, :created_at, :updated_at)
  end

  # 指定したパスワードで認証を行う。
  # @return [Object] @accounts アカウント一覧画面で表示するリスト
  def sort_direction
    %w[asc desc].include?(params[:sort_item]) ? params[:sort_item] : @sort_order
  end

  # 指定したパスワードで認証を行う。
  # @return [Object] @accounts アカウント一覧画面で表示するリスト
  def sort_column
    Account.column_names.include?(params[:sort]) ? params[:sort] : @sort_item
  end
end
