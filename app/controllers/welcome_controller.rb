class WelcomeController < ApplicationController
  def index
    session[:curso] = "Curso de Ruby on Rails - Jackson Pires [SESSION]"
    cookies[:curso] = "Curso de Ruby on Rails - Jackson Pires [COOKIE]"
    @meu_nome = params[:nome]
    @curso = params[:curso]
  end
end
