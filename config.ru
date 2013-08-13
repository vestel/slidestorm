require 'rubygems'
require 'sinatra'
require File.expand_path '../app.rb', __FILE__

set :environment, :production
disable :run

run Sinatra::Application
