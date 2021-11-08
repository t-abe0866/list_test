class AccountsController < ApplicationController

    helper_method :sort_column, :sort_direction

    @sort_item = ""
    @sort_item = ""

    def index
        if params[:sort_item]
            @sort_item = params[:sort_item]
        else
            @sort_item = "account_id"
        end

        if params[:sort_order]
            @sort_order = params[:sort_order]
        else
            @sort_order = "asc"
        end

        params[:sort_order]

        if params[:display_result]
            @display_result = params[:display_result]
        else
            @display_result = 10
        end
        
        @accounts = Account.order("#{sort_column} #{sort_direction}")
                            .order("#{sort_column} #{sort_direction}")
                            .order("#{sort_column} #{sort_direction}")
                            .order("#{sort_column} #{sort_direction}")
                            .order("#{sort_column} #{sort_direction}")
                            .order("#{sort_column} #{sort_direction}").page(params[:page]).per(@display_result)
    end
  
    def show
        @account = Account.find(params[:id])
    end
  
    def new
        @account = Account.new
    end
  
    def create

        @account = Account.new(account_params)

        @account.created_date = Date.today 
        @account.last_updated = Date.today 

        if @account.save
          flash[:success] = 'account が正常に投稿されました'
          redirect_to accounts_url
        else
          flash.now[:danger] = 'account が投稿されませんでした'
          render :new
        end
    end
  
    def edit
        @account = Account.find(params[:id])
    end
  
    def update

        @account = Account.find(params[:id])

        if @account.update(account_params)
          flash[:success] = 'account は正常に更新されました'
          redirect_to accounts_url
        else
          flash.now[:danger] = 'account は更新されませんでした'
          render :edit
        end
    end
  
    def destroy
        @account = Account.find(params[:id])
        @account.destroy
    
        flash[:success] = 'account は正常に削除されました'
        redirect_to accounts_url
    end

    private

    # Strong Parameter
    def account_params
      params.require(:account).permit(:account_id,:account_code,:mail_address,:family_name,:first_name,:kana_family_name,:kana_first_name,:birth_year,:birth_month,:birth_day,:valid_start_date,:valid_end_date,:is_valid,:memo,:created_date,:last_updated)
    end

    def sort_direction
        %w[asc desc].include?(params[:sort_item]) ? params[:sort_item] : @sort_order
    end
       
    def sort_column
        Account.column_names.include?(params[:sort]) ? params[:sort] : @sort_item
    end
end
