$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'simplecov'
SimpleCov.start

require 'nexpose-security-console'
require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
require 'byebug'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

