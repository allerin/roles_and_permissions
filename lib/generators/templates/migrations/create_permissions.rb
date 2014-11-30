class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.text :permissions
      t.references :resource, polymorphic: true, index: true

      t.timestamps
    end
  end
end
