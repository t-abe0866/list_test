require "test_helper"

class ControlDevicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @control_device = control_devices(:one)
  end

  test "should get index" do
    get control_devices_url
    assert_response :success
  end

  test "should get new" do
    get new_control_device_url
    assert_response :success
  end

  test "should create control_device" do
    post control_devices_url(@control_device), params: {control_device: {control_device_id: @control_device.control_device_id, name: @control_device.name, physical_code: @control_device.physical_code, is_gateway: @control_device.is_gateway, schema_id: @control_device.schema_id, memo: @control_device.memo}}
    assert_redirected_to new_control_device_path
  end

  test "should show control_device" do
    get control_device_url(@control_device)
    assert_response :success
  end

  test "should get edit" do
    get edit_control_device_url(@control_device)
    assert_response :success
  end

  test "should update control_device" do
    patch control_device_url(@control_device), params: {control_device: {control_device_id: @control_device.control_device_id, name: @control_device.name, physical_code: @control_device.physical_code, is_gateway: @control_device.is_gateway, schema_id: @control_device.schema_id, memo: @control_device.memo}}
    assert_redirected_to edit_control_device_path
  end

  test "should destroy control_device" do
    assert_difference("ControlDevice.count", -1) do
      delete control_device_url(@control_device)
    end
    assert_redirected_to control_devices_url
  end
end
