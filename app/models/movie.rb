class Movie < ApplicationRecord
  has_many :movie_roles
  has_many :roles, through: :movies
  has_many :feedback
  has_many :user, through: :feedback
  has_many :ratings
  has_many :user_rating, through: :ratings, class_name: :User
  has_many :likes, class_name: :Like, as: :likeable

  belongs_to :created_by, class_name: :User, inverse_of: 'movies_created', foreign_key: 'user_id'

  has_one :profile_photo, class_name: :Image, as: :imageable
  accepts_nested_attributes_for :profile_photo, allow_destroy: true

  validates :name, presence: true
  validates :synopsis, presence: true
  validates :release_date, presence: true

  serialize :genres
  serialize :video_quality
  serialize :languages

  scope :total_downloads, -> { order(downloads: :desc) }
  scope :recent_releases, -> { order(release_date: :desc) }
  scope :search_on_starting_year, -> (release_year) { where('YEAR(release_date) >= ?', release_year)unless release_year.nil? || release_year.empty?}
  scope :search_on_ending_year, -> (release_year) { where('YEAR(release_date) <= ?', release_year)unless release_year.nil? || release_year.empty?}
  scope :search_rating, ->(rating_bound) { left_outer_joins(:ratings).group('id').having('AVG(ratings.value) > ?', rating_bound) unless rating_bound.nil? || rating_bound.empty?}
  scope :order_on_filter, ->(orders_filter) { left_outer_joins(:ratings, :likes).group('id').order(orders_filter) unless orders_filter.nil? || orders_filter.empty?}
  scope :search_language, ->(language) { where(languages: language) unless language.nil? || language.empty? }
  scope :search_genre, ->(genre) { where('genres LIKE ?', "%#{genre}%") unless genre.nil? || genre.empty? }
  scope :search_video_quality, ->(video_quality) { where('video_quality LIKE ?', "%#{video_quality}%") unless video_quality.nil? || video_quality.empty?}
  scope :search_title, ->(title) { where('name LIKE ?', "%#{title}%") unless title.nil? || title.empty? }


  def self.ransackable_scopes(_auth_object = nil)
    [:search_title, :search_genre, :search_on_starting_year, :search_on_ending_year, :search_rating, :order_on_filter, :search_language, :search_video_quality]
  end

end
