class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :title
      t.text :image
      t.string :rule
      t.string :parametr

      t.timestamps
    end
  end
end
