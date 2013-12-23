require "spec_helper"

feature "Reordering sandboxes" do

  before :each do
    visit "/"
    instantiate_block "BlueSquareBlock"
    instantiate_block "RedSquareBlock"
    publish_sandboxes
  end

  it "has the blocks properly configured in the starting position", js: true do
    expect(Sandbox.first.order.length).to eq(2)
    expect(Sandbox.first.order - [2, 1]).to be_empty
  end

  it "can save changes in the displayed order of blocks", js: true do
    orig_order = Array.new Sandbox.first.order
    page.execute_script("
      var topBlock = $($('.block')[0]);
      var bottomBlock = $($('.block')[1]);
      topBlock.remove().insertAfter(bottomBlock);
    ")
    publish_sandboxes
    expect(Sandbox.first.order).not_to eq(orig_order)
  end

  it "can move blocks between sandboxes", js: true do
    page.execute_script("
      $($('.block')[0]).remove().appendTo(page.sandboxes.last().view.$el);
    ")
    publish_sandboxes
    expect(Sandbox.first.order.length).to eq(1)
    expect(Sandbox.last.order.length).to eq(1)
  end
end
