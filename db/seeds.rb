
require 'csv'
####FOR AIRLINE AND ROUTES
def csv_to_array(file_location)
    csv = CSV::parse(File.open(file_location, 'r') {|f| f.read })
    fields = csv.shift
    fields = fields.map {|f| f.downcase}
    csv.collect { |record| Hash[*fields.zip(record).flatten ] }
end

  ####FOR AIRPORTS
def parse_dat(dat_file, info_type, keys)
  input = File.open(dat_file, File::RDONLY){|f| f.read }
  #input is one long string
  input.delete!('\\"')
  input.delete!('\\\"')
  lines = input.split(/\n/)
  info_type = []
  data = []
  lines.map! do |line|
    formatted = line.split(',')
    #refactor with array
    formatted[0]=formatted[0].to_i
    formatted[6]=formatted[6].to_f
    formatted[7]=formatted[7].to_f
    formatted[8]=formatted[8].to_f
    formatted[9]=formatted[9].to_f
    data << formatted
  end
    data.map! do |x|
      data_info = Hash[keys.zip(x)]
      info_type << data_info
    end
    return info_type.flatten
end

airport_keys = ['airport id', ' name', ' city', ' country', ' iata', ' icao', ' latitude', ' longitude', ' altitude', ' timezone', ' DST', ' tz database time zone', ' type', ' source']

airports = parse_dat('airports.dat', 'airports', airport_keys)
airlines = csv_to_array('airlines.csv')
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
