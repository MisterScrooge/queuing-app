class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.integer :queuing_number, default: 0
      t.string :customer_name
      t.string :mobile_number
      t.integer :pax
      t.datetime :queued_at
      t.datetime :served_at
      t.boolean :is_served, default: false
      t.timestamps
    end
  end
end
