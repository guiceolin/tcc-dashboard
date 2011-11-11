require 'grit'
require 'pygments'

Grit::Blob.class_eval do
  include Colorize
end

