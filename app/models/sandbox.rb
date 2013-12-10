class Sandbox < ActiveRecord::Base
  attr_accessible :name, :page_id, :order
  serialize :order, Array
  has_many :blocks
  belongs_to :page
end
