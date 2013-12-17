require "spec_helper"

describe "Block Instantiation" do

  BLOCK_TYPES = [
    # 'HTMLBlock','BlueSquareBlock', 'RedSquareBlock', 'ContactFormBlock',
    # 'PageMenuBlock', 'PostListBlock', 'ShowImageBlock', 'SlideshowBlock',
    'TextBlock'
  ]

  before :each do
    visit "/"
  end

  shared_examples_for "a block type" do

    it "and has an instantiator", js: true do
      within dock do
        expect(!!instantiator).to be_true
      end
    end

    it "and can be instantiated by click-and-drag", js: true do
      instantiator.drag_to primary_sandbox
      expect(!!page.find('.block')).to be_true
    end
  end

  BLOCK_TYPES.each do |block_type|
    it_should_behave_like "a block type" do
      let(:block_type) { block_type }
      let(:dock) { page.find ".instantiator-dock[data-type='#{block_type}']" }
      let(:instantiator) { dock.find ".instantiator" }
      let(:primary_sandbox) { page.find "#sandbox-primary" }
    end
  end
end
