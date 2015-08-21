require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/client")
require("./lib/stylist")
require("pg")

DB = PG.connect({:dbname => "hair_salon_test"})

get("/") do
  erb(:index)
end

get("/stylists/new") do
  erb(:stylist_form)
end

post("/stylists") do
  name = params.fetch("name")
  stylist = Stylist.new({:name => name, :id => nil})
  stylist.save()
  erb(:success)
end

get('/stylists') do
  @stylists = Stylist.all()
  erb(:stylists)
end

get('/stylists/:id') do
  @stylist = Stylist.find(params.fetch("id").to_i())
  erb(:stylist_clients)
end

post("/clients") do
  name = params.fetch("name")
  stylist_id = params.fetch("stylist_id").to_i()
  @stylist = Stylist.find(stylist_id)
  @client = Client.new({:name => name, :stylist_id => stylist_id})
  @client.save()
  erb(:success)
end

patch('/stylists/:id') do
  name = params.fetch("name")
  @stylist = Stylist.find(params.fetch('id').to_i())
  @stylist.update({:name => name})
  erb(:success)
end

delete('/stylists/:id') do
  @stylist = Stylist.find(params.fetch('id').to_i())
  @stylist.delete()
  @stylist = Stylist.all()
  erb(:index)
end
