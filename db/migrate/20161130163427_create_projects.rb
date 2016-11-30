class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :slogan
      t.text :description
      t.boolean :approved
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
