class CreateConflines < ActiveRecord::Migration
  def up
      create_table :conflines do |t|
        t.string :name
        t.string :value
      end
      
      say "Table created!"

      Confline.create({name: "refresh", value: "9000"})
      Confline.create({name: "emergency", value: "0"})

      say "Defaults created!"
  end

  def down
    drop_table :conflines
  end
end
