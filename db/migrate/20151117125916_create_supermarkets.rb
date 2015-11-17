class CreateSupermarkets < ActiveRecord::Migration
  def change
    create_table :supermarkets do |t|
      t.string :name
      t.references :cep, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
