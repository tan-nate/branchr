class UserMash < ActiveRecord::Base
  belongs_to :user
  belongs_to :mash
end
