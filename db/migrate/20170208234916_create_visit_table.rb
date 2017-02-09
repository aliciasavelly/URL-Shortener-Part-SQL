class CreateVisitTable < ActiveRecord::Migration
  def change
    create_table :visit_tables do |t|
      t.integer :user_id, null: false
      t.string  :shortened_url, null: false
      t.timestamps
    end
  end
end
