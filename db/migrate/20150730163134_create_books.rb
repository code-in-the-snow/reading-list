class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :author, null: false
      t.boolean :fiction, default: true, null: false
      t.boolean :mystery, default: false, null: false
      t.datetime :completed, null: false

      t.timestamps
    end
  end
end
