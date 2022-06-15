class ChangeSpellig < ActiveRecord::Migration[7.0]
  def change
    rename_column :articles, :descreption, :description
  end
end
