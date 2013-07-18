class CreateSites < ActiveRecord::Migration
  def up
      create_table :sites do |t|
        t.string :label
        t.string :url
        t.boolean :active
      end
  end

  def down
    drop_table :sites
  end
end
