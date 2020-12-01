class SearchController < ApplicationController

    def trajetos
        @trajetos = Trajeto.where("lower(local_partida) LIKE ? AND lower(local_destino) LIKE ?",
                                  "%#{params[:term].downcase}%", "%#{params[:term2].downcase}%")
    end

    def campus
    end

    def iduff
        @iduff = Pub::IdentificacaoLogin.where("lower(nome) LIKE ?", "%#{params[:term].downcase}%").limit(20)
    end
end
