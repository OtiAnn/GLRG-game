class Post < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  mount_uploader :picture, PicUploader
end
