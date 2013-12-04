class Block < ActiveRecord::Base
  attr_accessible :options, :sandbox_id, :type
  belongs_to :sandbox
  serialize :options, Hash

  def serializable_hash options=nil
    super.merge "type" => type
  end

  def self.create_child_models
    child_models = ['HTMLBlock', 'BlueSquareBlock', 'RedSquareBlock']
    child_models.each do |model_name|
      Object.const_set model_name, Class.new(Block)
    end
  end
end
