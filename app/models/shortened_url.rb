# == Schema Information
#
# Table name: shortened_urls
#
#  id         :integer          not null, primary key
#  long_url   :string           not null
#  short_url  :string           not null
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class ShortenedUrl < ActiveRecord::Base
  validates :long_url, :user_id, presence: true
  validates :short_url, presence: true, uniqueness: true


  def self.random_code
    url = ""
    while true
      url = "www.uniq.com/" + SecureRandom.urlsafe_base64
      break unless ShortenedUrl.exists?(url)
    end
    url
  end

  def self.create_short_url(long_url, user_id)
    short_url = ShortenedUrl.random_code
    ShortenedUrl.create!(long_url: long_url, short_url: short_url, user_id: user_id)
  end

  def num_clicks
    visits.count
  end

  def num_uniques
    data = URLShortner_development.instance.execute(<<-SQL, id: id)
      SELECT
        COUNT(DISTINCT visits.user_id)
      FROM
        visits
      WHERE
        visits.short_url_id = :id
    SQL

    data
  end

  def num_recent_uniques

  end

  belongs_to :creator,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :visits,
    primary_key: :id,
    foreign_key: :short_url_id,
    class_name: :Visit

  has_many :users,
    Proc.new {distinct},
    through: :visits,
    source: :user


end
