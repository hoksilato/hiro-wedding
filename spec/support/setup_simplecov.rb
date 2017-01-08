if ENV['COVERAGE']
  require 'simplecov'
  require 'coveralls'

  SimpleCov.formatter = SimpleCov::Formatter::HTMLFormatter
  SimpleCov.start :rails do
    filters.clear
    add_filter do |src|
      !(src.filename =~ /^#{SimpleCov.root}/) unless src.filename =~ /app/
    end
  end
end
