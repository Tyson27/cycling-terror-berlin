class AddUserReferenceToProblems < ActiveRecord::Migration[6.0]
  def change
    add_reference :problems, :user, null: false, foreign_key: true
  end
end
