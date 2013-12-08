class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.integer :project_id
      t.string :name
      t.decimal :pweight, :default=>1

      t.timestamps
    end
  end
end
