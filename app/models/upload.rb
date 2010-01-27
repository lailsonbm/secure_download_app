class Upload < ActiveRecord::Base
  validates_presence_of :name, :content_type, :path
end
