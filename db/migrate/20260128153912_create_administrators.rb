class CreateAdministrators < ActiveRecord::Migration[8.0]
  def change
    create_table :administrators do |t|
      t.string :nickname, null: false

      t.timestamps
    end

    add_index :administrators, :nickname, unique: true
  end
end
