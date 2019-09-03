class Route
attr_reader :options

  def initialize(attributes = {})
    @options = attributes
  end

  def legs
    @options["legs"].map do |payload_leg|
      Leg.new(payload_leg)
    end
  end

  def duration
    legs.inject(0) do |sum, leg|
      sum + leg.duration.to_i
    end
  end

  def next_departure_time
    ((Time.parse(legs.first.next_departure_time) - Time.now) / 60).to_i
    # puts " - #{ legs.first.next_departure_time }"
  end

  def next_departure_time_station
    legs.first.next_departure_time_station
  end

  def next_connection_time_station
    legs.first.next_arrival_time_station
  end

  def departure_station
    legs.first.subway_steps.first.departure_station
  end

  def arrival_station
    legs.first.subway_steps.last.arrival_station
  end

  def arrival_poi(user)
    BestPoiForStationAndProfile.call(arrival_station, user.profile)
  end

end
