require 'rsips'
require 'pathname'
require 'fileutils'


$spec_dir = Pathname(__FILE__).expand_path.parent
$tmp_dir = $spec_dir + "tmp"

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'
  config.before :suite do
    FileUtils.mkdir_p($tmp_dir)
  end
  
  # config.add_setting :tmp_dir, 'bacon'
end

def temp_path
  $tmp_dir
end


def fixture_path img
  File.join $spec_dir, 'fixtures', img
end
