class AddCoordinatesToProblems < ActiveRecord::Migration[6.0]
  def change
    add_column :problems, :latitude, :float
    add_column :problems, :longitude, :float
  end
end
