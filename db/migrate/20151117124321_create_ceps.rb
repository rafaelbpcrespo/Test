class CreateCeps < ActiveRecord::Migration
  def change
    create_table :ceps do |t|
      t.string :code

      t.timestamps null: false
    end
  end
end
