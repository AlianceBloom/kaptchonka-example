class Post < ActiveRecord::Base

  validates :title, :body, presence: true
  validates :title, length: { maximum: 75 }
  validates :body,  length: { maximum: 300 }

end
