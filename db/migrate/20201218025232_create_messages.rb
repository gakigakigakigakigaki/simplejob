class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text       :text,    null: false
      t.references :job,     foreign_key: true
      t.references :user,     foreign_key: true
      t.references :company,     foreign_key: true
      
      t.timestamps
    end
  end
end
