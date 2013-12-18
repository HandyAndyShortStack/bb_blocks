require "spec_helper"

def instantiate_block block_type
  page.execute_script(
    "page.sandboxes.first().blocks.add({
      type: '#{block_type}',
      sandbox_id: page.sandboxes.first().id
    }).view.enter();"
  )
end

describe "Block Instantiation" do

  BLOCK_TYPES = [
    'HTMLBlock','BlueSquareBlock', 'RedSquareBlock', 'ContactFormBlock',
    'PageMenuBlock', 'PostListBlock', 'ShowImageBlock', 'SlideshowBlock',
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

    it "and can be instantiated by click-and-drag" do
      #      _                       _               _       _              
      #     | |                     (_)             (_)     | |             
      #   __| |_ __ __ _  __ _  __ _ _ _ __   __ _   _ ___  | |_ ___   ___  
      #  / _` | '__/ _` |/ _` |/ _` | | '_ \ / _` | | / __| | __/ _ \ / _ \ 
      # | (_| | | | (_| | (_| | (_| | | | | | (_| | | \__ \ | || (_) | (_) |
      #  \__,_|_|  \__,_|\__, |\__, |_|_| |_|\__, | |_|___/  \__\___/ \___/ 
      #                   __/ | __/ |         __/ |                                                                                 
      #                  |___/ |___/         |___/                          
      #  _                   _   _          _            _   _ 
      # | |                 | | | |        | |          | | | |
      # | |__   __ _ _ __ __| | | |_ ___   | |_ ___  ___| |_| |
      # | '_ \ / _` | '__/ _` | | __/ _ \  | __/ _ \/ __| __| |
      # | | | | (_| | | | (_| | | || (_) | | ||  __/\__ \ |_|_|
      # |_| |_|\__,_|_|  \__,_|  \__\___/   \__\___||___/\__(_)
    end

    it "and can be instantiated via the console", js: true do
      instantiate_block block_type
      expect(!!page.find(".block")).to be_true
    end

    it "and can be saved", js: true do
      instantiate_block block_type
      page.execute_script "page.sandboxes.publish();"
      sleep 1
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
