class BestPoiForStationAndProfile

  def self.call(station, profile)
    pois = Poi.where(station_name: station) # => array de Pois
    if profile.escalator?
      return pois.find_by(escalator: true)
    else
      return pois.order(stairs_number: :asc).first
    end
  end

end

