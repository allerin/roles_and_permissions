class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.references :user, index: true
      t.string :status

      t.timestamps
    end
  end
end
