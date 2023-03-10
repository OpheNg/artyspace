class CreateArts < ActiveRecord::Migration[6.1]
  def change
    create_table :arts do |t|
      t.string :title
      t.string :description
      t.references :user, null: false, foreign_key: true
      t.string :category

      t.timestamps
    end
  end
end
