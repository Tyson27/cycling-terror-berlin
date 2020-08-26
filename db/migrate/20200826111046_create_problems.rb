class CreateProblems < ActiveRecord::Migration[6.0]
  def change
    create_table :problems do |t|
      t.string :category
      t.string :description
      t.string :location
      t.timestamp :date

      t.timestamps
    end
  end
end
