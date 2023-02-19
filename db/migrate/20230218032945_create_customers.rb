class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :customer_name
      t.integer :mobile_number
      t.integer :pax
      t.datetime :queued_at
      t.datetime :served_at
      t.boolean :is_served, default: false

      t.timestamps
    end
  end
end
