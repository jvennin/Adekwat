class SurveysController < ApplicationController
  skip_after_action :verify_authorized


  def answer
    if params[:poi] == "true"
      poi = Poi.find(params[:poi_id])
      poi.update(escalator: params[:escalator])
    end

    profile = current_user.profile
    score = profile.score.to_i
    score += 5
    # profile.score = score
    profile.update(score: score)
    # profile.save
    redirect_to profile_path(profile)

  end

  def form
    @poi = Poi.find(params[:poi_id])
  end

end
