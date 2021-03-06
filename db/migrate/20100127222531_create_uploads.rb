class CreateUploads < ActiveRecord::Migration
  def self.up
    create_table :uploads do |t|
      t.string :name
      t.string :content_type
      t.string :path
      
      t.timestamps
    end
  end

  def self.down
    drop_table :uploads
  end
end
