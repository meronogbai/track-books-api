class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.integer :total_chapters
      t.integer :completed_chapters

      t.timestamps
    end
    add_index :books, :title
  end
end
