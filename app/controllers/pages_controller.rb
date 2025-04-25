class PagesController < ApplicationController
  def accueil
    @formations = Formation.order(endDate: :desc)
    @experiences = Experience.order(endDate: :desc)
    @projets = Projet.order(dateEnd: :desc)
    @competences = Competence.all
  end

  def formation
    @formations = Formation.all
  end
end
