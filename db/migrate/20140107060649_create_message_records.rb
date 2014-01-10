class CreateMessageRecords < ActiveRecord::Migration
  def change
    create_table :message_records do |t|
      t.string :title
      t.integer :tsg_id
      t.integer :type_id

      t.timestamps
    end
  end
end
