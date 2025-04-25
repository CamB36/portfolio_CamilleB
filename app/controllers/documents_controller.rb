class DocumentsController < ApplicationController
  def show
    case params[:id]
    when "4"
      filepath = Rails.root.join("app/assets/docs/Fiche_E6_Slam_CamilleBoiche.pdf")
      filename = "Fiche_E6_Slam_CamilleBoiche.pdf"
    when "5"
      filepath = Rails.root.join("app/assets/docs/Fiche_E6_Portfolio.pdf")
      filename = "Fiche_E6_Portfolio.pdf"
    when "cv"
      filepath = Rails.root.join("app/assets/docs/CV_BoicheCamille.pdf")
      filename = "CV_BoicheCamille.pdf"
    else
      render plain: "Fichier introuvable", status: :not_found and return
    end

    if File.exist?(filepath)
      send_file filepath, filename: filename, type: "application/pdf", disposition: "inline"
    else
      render plain: "Fichier introuvable sur le disque", status: :not_found
    end
  end
end
