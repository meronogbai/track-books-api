class AddDefaultToBook < ActiveRecord::Migration[6.1]
  def change
    change_column_default :books, :completed_chapters, 0
  end
end
