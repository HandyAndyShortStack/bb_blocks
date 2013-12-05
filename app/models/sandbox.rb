class Sandbox < ActiveRecord::Base
  attr_accessible :name, :page_id, :order
  serialize :order, Array
  has_many :blocks
  belongs_to :page
  validate :force_valid_order

private

  def force_valid_order
    block_ids = self.blocks.pluck :id
    if self.order.length != block_ids.length || !self.order.-(block_ids).empty?
      self.order = self.order_was || block_ids
    end
  end
end
