class Tree < ActiveRecord::Base
  belongs_to :user
  has_many :branches
  has_many :votes

  def slug
    self.name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    self.all.find do |tree|
      tree.slug == slug
    end
  end
end
