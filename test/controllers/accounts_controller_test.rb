require "test_helper"

class AccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @account = accounts(:one)
  end

  test "should get index" do
    get accounts_url
    assert_response :success
  end

  test "should get new" do
    get new_account_url
    assert_response :success
  end

  test "should create account" do
    post accounts_url(@account), params: {account: {account_id: @account.account_id, account_code: @account.account_code, mail_address: @account.mail_address, password: @account.password_digest, family_name: @account.family_name, first_name: @account.first_name, kana_family_name: @account.kana_family_name, kana_first_name: @account.kana_first_name, birth: @account.birth, valid_start_date: @account.valid_start_date, valid_end_date: @account.valid_end_date, is_valid: @account.is_valid, memo: @account.memo}}
    assert_redirected_to new_account_path
  end

  test "should show account" do
    get account_url(@account)
    assert_response :success
  end

  test "should get edit" do
    get edit_account_url(@account)
    assert_response :success
  end

  test "should update account" do
    patch account_url(@account), params: {account: {account_id: @account.account_id, account_code: @account.account_code, mail_address: @account.mail_address, password: @account.password_digest, family_name: @account.family_name, first_name: @account.first_name, kana_family_name: @account.kana_family_name, kana_first_name: @account.kana_first_name, birth: @account.birth, valid_start_date: @account.valid_start_date, valid_end_date: @account.valid_end_date, is_valid: @account.is_valid, memo: @account.memo}}
    assert_redirected_to edit_account_path
  end

  test "should destroy account" do
    assert_difference("Account.count", -1) do
      delete account_url(@account)
    end
    assert_redirected_to accounts_url
  end
end
