class CreateBemaps < ActiveRecord::Migration
  def change
    create_table :bemaps do |t|
      t.string :atch_file_name
      t.string :atch_content_type
      t.integer :atch_file_size

      t.timestamps
    end
  end
end
