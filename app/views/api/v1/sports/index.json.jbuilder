json.array! @sports.each do |sport|
  json.name sport.name
  json.players sport.players
  json.country_of_origin sport.country_of_origin
end