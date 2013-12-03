class Page < ActiveRecord::Base
  attr_accessible :options, :site_id, :template_id, :title, :url
  has_many :sandboxes
end
