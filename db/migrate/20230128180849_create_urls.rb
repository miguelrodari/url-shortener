class CreateUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :urls do |t|
      t.string :url, null: false
      t.string :short_url
      t.integer :visits
      t.string :title

      t.timestamps
    end
  end
end
