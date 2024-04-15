class CreatePostTags < ActiveRecord::Migration[7.1]
  def change
    create_table :post_tags do |t|
      t.belongs_to :post, null: false, foreign_key: true
      t.belongs_to :tag, null: false, foreign_key: true

      t.timestamps
    end

    #чтобы не появилось двух одинаковых записей
    add_index :post_tags, [:post_id, :tag_id], unique: true
  end
end
