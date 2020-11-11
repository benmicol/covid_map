class CreateCoronaData < ActiveRecord::Migration[6.0]
  def change
    create_table :corona_data do |t|
      t.string :country
      t.string :confirmed_cases

      t.timestamps
    end
  end
end
