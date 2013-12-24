require "spec_helper"
require "timeout"

BLOCK_TYPES = [
  'HTMLBlock','BlueSquareBlock', 'RedSquareBlock', 'ContactFormBlock',
  'PageMenuBlock', 'PostListBlock', 'ShowImageBlock', 'SlideshowBlock',
  'TextBlock'
]

describe "Block Instantiation" do

  before :each do
    visit "/"
  end

  shared_examples_for "a block" do

    it "and has an instantiator", js: true do
      within dock do
        expect(!!instantiator).to be_true
      end
    end

    # dragging turned out to be too difficult to test
    # it "and can be instantiated by click-and-drag", js: true

    it "and can be instantiated via the console", js: true do
      instantiate_block block_type
      expect(!!page.find(".block")).to be_true
    end

    it "and can be saved", js: true do
      instantiate_block block_type
      publish_sandboxes
      visit current_path
      expect(!!page.find(".block")).to be_true
    end

    it "and can be persistently deleted", js: true do
      instantiate_block block_type
      publish_sandboxes
      expect(Sandbox.first.blocks.length).to eq(1)
      within(".block") { find(".icon-trash").click }
      publish_sandboxes
      wait_until { Sandbox.first.blocks.length == 0 }
    end
  end

  BLOCK_TYPES.each do |block_type|
    describe block_type do
      it_should_behave_like "a block" do
        let(:block_type) { block_type }
        let(:dock) { page.find ".instantiator-dock[data-type='#{block_type}']" }
        let(:instantiator) { dock.find ".instantiator" }
        let(:primary_sandbox) { page.find "#sandbox-primary" }
      end
    end
  end
end
