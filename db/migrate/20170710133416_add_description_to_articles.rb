class AddDescriptionToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :decsription, :text
    add_column :articles, :creat_at, :datetime
    add_column :articles, :updated_at, :datetime
  end
end
