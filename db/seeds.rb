# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

organizers = Organizer.create([
  { name: "Bob Loblaw", email: "bobloblaw@example.com", location: 'POINT(-122.393598 37.782794 )'},
  { name: "Doug Peltz", email: "doug@example.com", location: 'POINT(-122.393941 37.785236 )'},
  { name: "Keith Schacht", email: "keith@example.com", location: 'POINT(-122.399370 37.790968 )'},
  { name: "Jared Seehafer", email: "jared@example.com", location: 'POINT(-122.398898 37.776434 )'}
])
