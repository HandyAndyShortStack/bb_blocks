def instantiate_block block_type
  page.execute_script("
    page.sandboxes.first().blocks.add({
      type: '#{block_type}'
    }).view.enter();
  ")
end

def publish_sandboxes
  page.execute_script("
    page.sandboxes.publish(function() {
      window.readyForReload = true;
    });
  ")
  wait_until { page.evaluate_script "readyForReload" }
  page.execute_script "delete window.readyForReload;"
end

def wait_until
  Timeout.timeout(Capybara.default_wait_time) do
    sleep(0.1) until value = yield
    value
  end
end
