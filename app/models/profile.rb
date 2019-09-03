class Profile < ApplicationRecord
  belongs_to :user # optional: true

  def coef_multiplicateur_duration
    case walking_duration
    when 10
      return 1.4
    when 15
      return 1.2
    else
      return 1.1
    end
  end
end
