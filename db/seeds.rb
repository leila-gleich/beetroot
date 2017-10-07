
require 'csv'

# csv_text = File.read(Rails.root.join('lib', 'seeds', 'airlines.csv'))
# airlines = CSV.parse(csv_text, :headers => true)
def csv_to_array(file_location)
    csv = CSV::parse(File.open(file_location, 'r') {|f| f.read })
    fields = csv.shift
    fields = fields.map {|f| f.downcase}
    csv.collect { |record| Hash[*fields.zip(record).flatten ] }
end
airlines = csv_to_array(Rails.root.join('lib', 'seeds', 'airlines.csv'))
airports = csv_to_array(Rails.root.join('lib', 'seeds', 'airports.csv'))
routes = csv_to_array(Rails.root.join('lib', 'seeds', 'routes.csv'))

airlines.each do |airline|
  Airline.create(
  airline_id: airline["airline id"].to_i,
  name: airline[" name"],
  alias: airline[" alias"],
  iata: airline[" iata"],
  icao: airline[" icao"],
  callsign: airline[" callsign"],
  country: airline[" country"],
  active: airline[" active"])
end


airports.each do |airport|
  Airport.create(
  airport_id: airport["airport id"].to_i,
  name: airport[" name"],
  city: airport[" city"],
  country: airport[" country"],
  iata: airport[" iata"],
  icao: airport[" icao"],
  latitude: airport[" latitude"].to_f,
  longitude: airport[" longitude"].to_f,
  altitude: airport[" altitude"].to_i,
  timezone: airport[" timezone"],
  dst: airport[" DST"],
  tz_db_timezone: airport[" tz database time zone"],
  ap_type: airport[" type"],
  source: airport[" source"],
  )
end

routes.each do |route|
  Route.create(
  airline: route["airline"],
  airline_id: route[" airline id"].to_i,
  source_airport: route[" source airport"],
  source_airport_id: route[" source airport id"].to_i,
  destination_airport: route[" destination airport"],
  destination_airport_id: route[" destination airport id"].to_i,
  codeshare: route[" codeshare"],
  stops: route[" stops"],
  equipment:  route[" equipment"],
  )
end
