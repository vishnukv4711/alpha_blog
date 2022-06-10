class Articles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :descreption
      t.string :author
    end
  end
end
