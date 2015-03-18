class CleanUpDeleted < ActiveRecord::Migration
  def change
    drop_table :deleted_articles
    drop_table :cms_deleted
    create_table :comfy_cms_darticles do |t|
      t.integer :article_id
      t.timestamps
    end
  end
end
