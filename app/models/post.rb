class Post < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  mount_uploader :picture, PicUploader

  scope :sorted_by_post_id, -> { order('id asc') }
end
