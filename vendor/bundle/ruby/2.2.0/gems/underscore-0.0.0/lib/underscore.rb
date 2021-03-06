__DIR__ = File.dirname(__FILE__)

$LOAD_PATH.unshift __DIR__ unless
  $LOAD_PATH.include?(__DIR__) ||
  $LOAD_PATH.include?(File.expand_path(__DIR__))

require 'rubygems'
require 'rack'

require 'underscore/css'
require 'underscore/html'
require 'underscore/http'

module Underscore
end
US = Underscore
