class CreateDashboards < ActiveRecord::Migration[6.1]
  def change
    create_table :dashboards do |t|
      t.belongs_to :user
      t.string :name, null: false
      t.boolean :default, default: false

      t.timestamps
    end
  end
end
