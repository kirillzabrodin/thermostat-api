class ThermostatStates < ActiveRecord::Migration[5.0]
  def change
    create_table :states do |t|
      t.text     :city
      t.boolean  :state
      t.integer  :temp

      t.timestamps null: false
    end
  end
end
