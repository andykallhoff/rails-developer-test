class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :category
      t.text :content
      t.belongs_to :user
    end
  end
end
