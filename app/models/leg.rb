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
end
