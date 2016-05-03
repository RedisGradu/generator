class IdentitiesController < ApplicationController
  before_action :set_identity, only: [:show, :update, :destroy]

  # GET /identities
  # GET /identities.json
  def index
    @identities = Identity.all

    render json: @identities
  end

  # GET /identities/1
  # GET /identities/1.json
  def show
    render json: @identity
  end

  # POST /identities
  # POST /identities.json
  def create
    @identity = Identity.new(identity_params)

    if @identity.save
      render json: @identity, status: :created, location: @identity
    else
      render json: @identity.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /identities/1
  # PATCH/PUT /identities/1.json
  def update
    @identity = Identity.find(params[:id])

    if @identity.update(identity_params)
      head :no_content
    else
      render json: @identity.errors, status: :unprocessable_entity
    end
  end

  # DELETE /identities/1
  # DELETE /identities/1.json
  def destroy
    @identity.destroy

    head :no_content
  end

  private

    def set_identity
      @identity = Identity.find(params[:id])
    end

    def identity_params
      params.require(:identity).permit(:customer_id, :citizen_no, :full_name, :birthdate, :place_of_birth, :mother_name, :father_name, :district)
    end
end
