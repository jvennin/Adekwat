class Step
  attr_reader :travel_mode, :options

  def initialize(attributes = {})
    @travel_mode = attributes["travel_mode"]
    @options = attributes
  end

  def is_walking?
    @travel_mode == "WALKING"
  end

  def is_subway?
    @travel_mode == "TRANSIT"
  end

  def line_color
    if @travel_mode == "TRANSIT"
      @options["transit_details"]["line"]["color"]
    end
  end

  def line_color_text
    if @travel_mode == "TRANSIT"
      @options["transit_details"]["line"]["text_color"]
    end
  end

  def line_short_name
    if @travel_mode == "TRANSIT"
      @options["transit_details"]["line"]["short_name"]
    end
  end

  def is_rer
    if @options["transit_details"]["line"]["short_name"].include?("RER")
      return "rer"
    elsif @options["transit_details"]["line"]["short_name"].include?("T")
      return "tram"
    end
  end

  def next_departure_time
    @options["transit_details"]["departure_time"]["text"] if @travel_mode == "TRANSIT"
  end

  def departure_station
    @options["transit_details"]["departure_stop"]["name"] if @travel_mode == "TRANSIT"
  end

  def arrival_station
    @options["transit_details"]["arrival_stop"]["name"] if @travel_mode == "TRANSIT"
  end

  def departure_poi
    Poi.find_by(station_name: departure_station)
  end

  def arrival_poi
    Poi.find_by(station_name: arrival_station)
  end
end
