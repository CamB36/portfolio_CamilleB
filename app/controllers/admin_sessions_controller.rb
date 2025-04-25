# app/controllers/admin_sessions_controller.rb
class AdminSessionsController < ApplicationController
  def new
    # Affiche le formulaire de connexion
  end

  def create
    username = params[:username]
    password = params[:password]

    if username == Rails.application.credentials.admin[:username] && password == Rails.application.credentials.admin[:password]
      session[:admin] = true
      redirect_to root_path, notice: 'Connecté en tant qu\'admin.'
    else
      flash.now[:alert] = 'Identifiants incorrects.'
      render :new
    end
  end

  def destroy
    session[:admin] = nil
    redirect_to root_path, notice: 'Déconnecté.'
  end
end