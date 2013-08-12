require 'rubygems'
require 'sinatra'
require File.expand_path '../app.rb', __FILE__

set :environment, :production
disable :run

require File.join(File.dirname(__FILE__), 'consolka')
run Sinatra::Application
