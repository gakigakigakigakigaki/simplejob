class CreateMemos < ActiveRecord::Migration[6.0]
  def change
    create_table :memos do |t|

      t.timestamps
      t.references :user, foreign_key: true
      t.string :title
      t.datetime :start_time
      t.datetime :end_time
    end
  end
end
