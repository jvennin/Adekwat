class Step

attr_reader :travel_mode, :options

  def initialize(attributes = {})
    @travel_mode = attributes["travel_mode"]
    @options = attributes
  end

  def is_walking?
    @travel_mode == "WALKING"
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
end
