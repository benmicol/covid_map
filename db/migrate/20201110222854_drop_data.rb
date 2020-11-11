class DropData < ActiveRecord::Migration[6.0]
  def change
    drop_table :corona_data
  end
end
