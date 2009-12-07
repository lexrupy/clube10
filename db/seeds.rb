# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

Court.create(:name => 'Tênnis', :value => 30)
Court.create(:name => 'Futebol society', :value => 25)
Court.create(:name => 'Futebol de Quadra', :value => 20)
Court.create(:name => 'Quadra de Basquete', :value => 15)
Court.create(:name => 'Quadra de Vôlei', :value => 20)
