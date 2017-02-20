class AddTopicIdToBlogs < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :topic_id, :integer
  end
end
