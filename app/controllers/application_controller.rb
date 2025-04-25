# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  before_action :charger_projets

  private

  def admin_required
    unless session[:admin]
      redirect_to root_path, alert: 'Accès réservé à l\'admin.'
    end
  end

  def charger_projets
    @projets = Projet.all
  end
end