class Word < ActiveRecord::Base
  has_many :mashes, through: :word_mashes
  has_many :categories, through: :mashes
end
