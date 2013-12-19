require "spec_helper"

def instantiate_block block_type
  page.execute_script(
    "page.sandboxes.first().blocks.add({
      type: '#{block_type}',
      sandbox_id: page.sandboxes.first().id
    }).view.enter();"
  )
end

def wait_until
  require "timeout"
  Timeout.timeout(Capybara.default_wait_time) do
    sleep(0.1) until value = yield
    value
  end
end

BLOCK_TYPES = [
  'HTMLBlock','BlueSquareBlock', 'RedSquareBlock', 'ContactFormBlock',
  'PageMenuBlock', 'PostListBlock', 'ShowImageBlock', 'SlideshowBlock',
  'TextBlock'
]

describe "Block Instantiation" do

  before :each do
    visit "/"
  end

  shared_examples_for "a block type" do

    it "and has an instantiator", js: true do
      within dock do
        expect(!!instantiator).to be_true
      end
    end

    # dragging turned out to be too difficult to test
    # it "and can be instantiated by click-and-drag"

    it "and can be instantiated via the console", js: true do
      instantiate_block block_type
      expect(!!page.find(".block")).to be_true
    end

    it "and can be saved", js: true do
      instantiate_block block_type
      page.execute_script "page.sandboxes.publish(function() { window.readyForReload = true; });"
      wait_until { page.evaluate_script "readyForReload" }
      visit current_path
      expect(!!page.find(".block")).to be_true
    end
  end

  BLOCK_TYPES.each do |block_type|
    describe block_type do
      it_should_behave_like "a block type" do
        let(:block_type) { block_type }
        let(:dock) { page.find ".instantiator-dock[data-type='#{block_type}']" }
        let(:instantiator) { dock.find ".instantiator" }
        let(:primary_sandbox) { page.find "#sandbox-primary" }
      end
    end
  end
end
