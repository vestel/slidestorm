require "sinatra"
require "sinatra/activerecord"

class Site < ActiveRecord::Base
    validates_presence_of :label
    validates_presence_of :url
end

class Confline < ActiveRecord::Base
end
