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
  validates :long_url, , :short_url, :user_id, presence: true
  validates :short_url, uniqueness: true
  ### TO DO


  def self.random_code
    loop do
      url = "www.uniq.com/" + SecureRandom.urlsafe_base64
      return url unless ShortenedUrl.exists?(short_url: url)
    end
  end

  def self.create_short_url(long_url, user_id)
    short_url = ShortenedUrl.random_code
    ShortenedUrl.create!(long_url: long_url, short_url: short_url, user_id: user_id)
  end

  def num_clicks
    visits.count
  end

  def num_uniques
    visits.select("user_id").distinct.count
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
    ### dependent: :destroy ???

  has_many :visitors,
    Proc.new {distinct},
    through: :visits,
    source: :user

end
