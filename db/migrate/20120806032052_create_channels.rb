class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.integer :cid
      t.string  :title
      t.integer :state
      t.integer :position
      t.timestamps
    end
  end
end
