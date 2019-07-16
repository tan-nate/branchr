class User < ActiveRecord::Base
  has_secure_password
  has_many :trees
  has_many :votes

  def slug
    self.username.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    self.all.find do |user|
      user.slug == slug
    end
  end

  def unique?
    !self.class.find_by_slug(self.username)
  end
end
