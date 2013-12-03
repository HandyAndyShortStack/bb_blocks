class Sandbox < ActiveRecord::Base
  attr_accessible :name, :page_id
  has_many :blocks
  belongs_to :page
end