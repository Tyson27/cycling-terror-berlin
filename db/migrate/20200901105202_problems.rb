class Problems < ActiveRecord::Migration[6.0]
  def change
    change_column :problems, :description, :text
  end
end
