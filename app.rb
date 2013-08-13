require "sinatra"
require "sinatra/activerecord"

set :database, 'sqlite:///database.sqlite'
require './models.rb'

get '/' do
    refreshObj = Confline.find_by_name('refresh')
    @refreshRate = refreshObj.value 
    rebooted = Confline.find_by_name('emergency')
    rebooted.update_attributes({value:"0"}) if rebooted
    erb :index 
end

get '/active.json' do
    Site.where({active:"t"}).all.to_json
end

get '/emergency.json' do
    Confline.find_by_name("emergency").to_json
end

get '/config/' do
    @sitelist = Site.all
    @refresh = Confline.find_by_name('refresh')
    erb :list
end

post '/config/confline/:key' do
    line = Confline.find_by_name(params[:key])
    line.value = value unless params[:value]
    line.save!
    erb :save
end

post '/config/site/add' do
    Site.create({label: params[:label], url: params[:url], active: params[:active]})
    erb :save
end

post '/config/site/edit/:id' do
    @params = params
    site = Site.find(params[:id])
    site.active = true if params[:active]
    site.active = false unless params[:active]
    site.label = params[:label]
    site.url = params[:url]
    site.save!
    erb :save
end

delete '/config/site/delete/:id' do
    Site.find(params[:id]).destroy!
    "Deleted!"
end
