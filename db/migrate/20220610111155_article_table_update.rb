class ArticleTableUpdate < ActiveRecord::Migration[7.0]
  def change
    remove_column :articles, :author
    add_column :articles, :created_at, :datetime
    add_column :articles, :updated_at, :datetime
  end
end
