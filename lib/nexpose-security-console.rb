require 'nexpose-security-console/version.rb'
require 'nexpose'
require 'dotenv'
require 'byebug'

# Add requires for other files you add to your project here, so
# you just need to require this one file in your bin file

module NexposeSecurityConsole
  def self.connection(username, password, server, port)
    Dotenv.load
    nsc = Nexpose::Connection.new(server, username, password, port)
    # nsc.login
    nsc
  end

  def self.credentials
  end


  # login with credential values stored in the ENV variables
  def self.login
    Dotenv.load
    server = ENV['NEXPOSE_HOST']
    username = ENV['NEXPOSE_USER']
    password = ENV['NEXPOSE_PASSWORD']
    port = ENV['NEXPOSE_PORT']
    nsc = Nexpose::Connection.new(server, username, password, port)
    # nsc.login
    nsc
  end
end
