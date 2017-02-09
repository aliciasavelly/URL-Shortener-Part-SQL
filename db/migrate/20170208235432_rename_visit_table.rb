class RenameVisitTable < ActiveRecord::Migration
  def change
    rename_table :visit_tables, :visits
  end
end
