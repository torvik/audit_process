class DashboardController < ApplicationController
  def index
    @actionfolders = Actionfolder.all

    @totalpastas = Actionfolder.count

    @totalencerrado = Actionfolder.where(status: "Encerrado").count

    @totalbaixado = Actionfolder.where(status: "Baixado").count

    @totalgo  = Actionfolder.where(uf: "GO").count

    @advogados = Actionfolder.select(:lawyer).distinct.order("lawyer ASC")

    @uf = Actionfolder.select(:uf).distinct.order("uf ASC")
    
    
  end
end
