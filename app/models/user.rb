class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true, uniqueness: true

  # has_many :posts, dependent: :nullify
  #
  # has_many :comments, dependent: :nullify
  #
  # has_many :likes, dependent: :nullify
  # has_many :liked_posts, through: :likes, source: :post
  #
  # has_many :liked_categories, through: :liked_posts, source: :category

  def full_name
    "#{first_name} #{last_name}".strip
  end
end
