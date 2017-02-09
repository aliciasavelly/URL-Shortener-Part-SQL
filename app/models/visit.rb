# == Schema Information
#
# Table name: visits
#
#  id           :integer          not null, primary key
#  user_id      :integer          not null
#  created_at   :datetime
#  updated_at   :datetime
#  short_url_id :integer          not null
#

class Visit < ActiveRecord::Base

  def self.record_visit!(user_id, short_url_id)
    Visit.create!(user_id: user_id, short_url_id: short_url_id)
  end

  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :short_url,
    primary_key: :id,
    foreign_key: :short_url_id,
    class_name: :ShortenedUrl

end
