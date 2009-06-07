require 'spec'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'tagooru'

def fixture(filename)
  filename = File.basename(filename)
  file = File.join(File.dirname(__FILE__), "fixtures", filename)
  if File.exist?(file)
    fixture_store[filename] || fixture_store[filename] = File.read(file)
  end
end

private

def fixture_store
  @fixture_store ||= {}
end
