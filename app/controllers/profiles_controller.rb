class ProfilesController < ApplicationController
  before_action :set_profile, only: [:edit, :update, :create]

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Bienvenue! Votre profil a bien été créé 😀'}
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def show
    @profile = Profile.find(params[:id])
    authorize @profile
  end

  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Votre profil a été mis à jour!' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:points, :status)
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end
end
