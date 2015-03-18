class CreateDeletedArticles < ActiveRecord::Migration
  def change
    create_table :deleted_articles do |t|
      t.integer :article_id
      t.timestamps
    end
  end
end
