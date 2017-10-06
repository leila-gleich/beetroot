
require 'csv'
####FOR AIRLINE AND ROUTES
def csv_to_array(file_location)
    csv = CSV::parse(File.open(file_location, 'r') {|f| f.read })
    fields = csv.shift
    fields = fields.map {|f| f.downcase}
    csv.collect { |record| Hash[*fields.zip(record).flatten ] }
end
airlines = csv_to_array('/db/airlines.csv')
airports = csv_to_array('airports.csv')

routes = csv_to_array('routes.csv')

airlines.each do |airline|
  Airline.new(
  airline_id: airline["airline id"],
  name: airline[" name"],
  alias: airline[" alias"],
  iata: airline[" iata"],
  icao: airline[" icao"],
  callsign: airline[" callsign"],
  country: airline[" country"],
  active: airline[" active"])
end


airports.each do |airport|
  Airport.new(
  airport_id: airport["airport id"],
  name: airport[" name"],
  city: airport[" city"],
  country: airport[" country"],
  iata: airport[" iata"],
  icao: airport[" icao"],
  latitude: airport[" latitude"],
  longitude: airport[" longitude"],
  altitude: airport[" altitude"],
  timezone: airport[" timezone"],
  dst: airport[" DST"],
  tz_db_timezone: airport[" tz database time zone"],
  type: airport[" type"],
  source: airport[" source"],
  )
end

routes.each do |route|
  Route.new(
  airline: route["airline"],
  airline_id: route[" airline id"],
  source_airport: route[" source airport"],
  source_airport_id: route[" source airport id"],
  destination_airport: route[" destination airport"],
  destination_airport_id: route[" destination airport id"],
  codeshare: route[" codeshare"],
  stops: route[" stops"],
  equipment:  route[" equipment"],
  )
end
