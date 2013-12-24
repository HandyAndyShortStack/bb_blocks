class Sandbox < ActiveRecord::Base
  attr_accessible :name, :page_id, :order
  serialize :order, Array
  has_many :blocks
  belongs_to :page

  def trim_blocks
    self.blocks.each do |block|
      block.destroy unless self.order.include? block.id
    end
  end
end
