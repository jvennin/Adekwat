class Leg
  def initialize(attributes = {})
    @options = attributes
    # @steps = attributes[:steps]
  end

  def steps
    @options["steps"].map do |payload_step|
      Step.new(payload_step)
    end
  end

  def duration
    @options["duration"]["text"]
  end

  def next_departure_time
    first_transit_step = steps.find do |step|
      step.is_subway?
    end
    first_transit_step.next_departure_time
  end

  def next_departure_time_station
    #@options["transit_details"]["departure_stop"]["name"] if @travel_mode == "TRANSIT"
    first_transit_station = steps.find do |step|
      step.is_subway?
    end
    first_transit_station.next_departure_time_station
  end
end
