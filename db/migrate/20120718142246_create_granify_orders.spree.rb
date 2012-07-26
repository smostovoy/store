# This migration comes from spree (originally 1)
class CreateGranifyOrders < ActiveRecord::Migration
  def up
  	create_table :granify_orders do |t|
      t.string :token
      t.integer :order_id
      t.integer :user_id
      t.boolean :ready_for_sending
      t.datetime :sent_at
    end
  end

  def down
  	drop_table :granify_orders
  end
end