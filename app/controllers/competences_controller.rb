class CompetencesController < ApplicationController
  before_action :set_competence, only: %i[ show edit update destroy ]

  # GET /competences or /competences.json
  def index
    @competences = Competence.all
    @categories = Category.all # Charge toutes les catégories
  end

  # GET /competences/1 or /competences/1.json
  def show
  end

  # GET /competences/new
  def new
    @competence = Competence.new
  end

  # GET /competences/1/edit
  def edit
  end

  # POST /competences or /competences.json
  def create
    @competence = Competence.new(competence_params)

    respond_to do |format|
      if @competence.save
        format.html { redirect_to @competence, notice: "Competence was successfully created." }
        format.json { render :show, status: :created, location: @competence }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @competence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /competences/1 or /competences/1.json
  def update
    respond_to do |format|
      if @competence.update(competence_params)
        format.html { redirect_to @competence, notice: "Competence was successfully updated." }
        format.json { render :show, status: :ok, location: @competence }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @competence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /competences/1 or /competences/1.json
  def destroy
    @competence.destroy!

    respond_to do |format|
      format.html { redirect_to competences_path, status: :see_other, notice: "Competence was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_competence
      @competence = Competence.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def competence_params
      params.require(:competence).permit(:id, :title, :level, :category_id, :logo, :useTitle)
    end
end
