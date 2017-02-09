class AddShortUrlId < ActiveRecord::Migration
  def change
    remove_column :visits, :shortened_url
    add_column :visits, :short_url_id, :integer, null: false
  end
end
