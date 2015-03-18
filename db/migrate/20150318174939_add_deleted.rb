class AddDeleted < ActiveRecord::Migration
  def change
    create_table :cms_deleted do |t|
      t.integer :article_id
    end
  end
end
