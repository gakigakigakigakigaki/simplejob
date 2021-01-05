class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|
      t.references :user, foreign_key: true
      t.references :company, foreign_key: true
      t.references :follow, foreign_key: { to_table: :companies}

      t.timestamps

      t.index [:user_id, :company_id, :follow_id], unique: true
      
    end
  end
end
