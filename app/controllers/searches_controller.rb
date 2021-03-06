require 'pry'
class SearchesController < ApplicationController

  def new
    @search = Search.new
  end

  def create
    @search = Search.create(search_params)
    redirect_to @search
  end

  def show
    @search = Search.find(params[:id])
    @search = Search.search(@search.keywords.downcase, @search.category_id,@search.city.downcase,@search.country.downcase)
    #Permet d'envoyer les paramètres au model search et à les réutilisé dans la méthode self.search
  end

private

  def search_params
    params.require(:search).permit(:keywords,:category_id,:id,:city,:country)
  end
end
