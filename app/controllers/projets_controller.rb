class ProjetsController < ApplicationController
  before_action :set_projet, only: %i[ show edit update destroy ]

  # GET /projets or /projets.json
  # app/controllers/projets_controller.rb
def index
  if params[:filter] && params[:filter][:competence_ids]
    @projets = Projet.joins(:competences)
                     .where(competences: { id: params[:filter][:competence_ids] })
                     .distinct
  else
    @projets = Projet.all
  end
  @projets = @projets.includes(:competences)
end

  # GET /projets/1 or /projets/1.json
  def show
  end

  # GET /projets/new
  def new
    @projet = Projet.new
  end

  # GET /projets/1/edit
  def edit
  end

  # POST /projets or /projets.json
  def create
    @projet = Projet.new(projet_params)

    respond_to do |format|
      if @projet.save
        format.html { redirect_to @projet, notice: "Projet was successfully created." }
        format.json { render :show, status: :created, location: @projet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @projet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projets/1 or /projets/1.json
  def update
    respond_to do |format|
      if @projet.update(projet_params)
        format.html { redirect_to @projet, notice: "Projet was successfully updated." }
        format.json { render :show, status: :ok, location: @projet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @projet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projets/1 or /projets/1.json
  def destroy
    @projet.destroy!

    respond_to do |format|
      format.html { redirect_to projets_path, status: :see_other, notice: "Projet was successfully destroyed." }
      format.json { head :no_content }
    end
  end


def filter
  @projets = Projet.all.includes(:competences)
  
  if params[:search].present?
    @projets = @projets.where("title ILIKE ?", "%#{params[:search]}%")
  end
  
  if params[:competence_ids].present?
    @projets = @projets.joins(:competences)
                       .where(competences: { id: params[:competence_ids] })
                       .distinct
  end

  render partial: 'projects_list', locals: { projets: @projets }
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_projet
      @projet = Projet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def projet_params
      params.require(:projet).permit(:id, :title, :description, :dateStart, :dateEnd, :projet_type, :reference, :image, competence_ids: [])
    end
end
