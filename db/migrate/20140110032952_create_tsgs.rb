class CreateTsgs < ActiveRecord::Migration
  def change
    create_table :tsgs do |t|
      t.string :name
      t.string :department

      t.timestamps
    end
  end
end
