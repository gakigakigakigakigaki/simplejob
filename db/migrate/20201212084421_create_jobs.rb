class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string     :title, null: false
      t.integer    :jikyu, null: false
      t.integer    :period, null: false
      t.integer    :number_of_people, null: false
      t.integer    :prefecture_id, null: false
      t.integer    :working_hours, null: false
      t.text       :contents, null: false
      t.references :company, null: false,foreign_key: true

      t.timestamps
    end
  end
end
