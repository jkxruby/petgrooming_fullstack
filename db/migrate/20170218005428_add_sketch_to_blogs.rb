class AddSketchToBlogs < ActiveRecord::Migration[5.0]
  def change
  	add_column :blogs, :sketch, :string
  end
end
