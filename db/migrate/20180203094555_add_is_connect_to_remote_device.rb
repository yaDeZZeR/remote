class AddIsConnectToRemoteDevice < ActiveRecord::Migration
  def change
  	add_column :remote_devices, :is_connect, :boolean, default: false
  end
end
