class CreateSlides < ActiveRecord::Migration
  def self.up
    create_table :slides do |t|
      t.string :title
      t.string :strapline
      t.string :link
      t.integer :position, :default => 0
      t.datetime :published_at
      t.datetime :published_to

      t.string :filename, :default => 'no_file'
      t.string :content_type
      t.integer :size, :height, :width
      t.references :parent, :slide_show
      t.string :thumbnail

      t.timestamps
    end

   create_table :slide_shows do |t|
      t.string :title, :permalink
      t.integer :lock_level, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :slides
    drop_table :slide_shows
  end
end
