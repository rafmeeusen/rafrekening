class CreatePeweights < ActiveRecord::Migration
  def change
    create_table :peweights do |t|
      t.integer :person_id
      t.integer :expense_id
      t.decimal :weight

      t.timestamps
    end
  end
end
