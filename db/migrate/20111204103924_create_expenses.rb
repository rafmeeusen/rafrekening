class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.integer :person_id
      t.decimal :amount
      t.string :description

      t.timestamps
    end
  end
end
