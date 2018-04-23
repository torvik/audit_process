class DashboardController < ApplicationController
  def index
    @actionfolders = Actionfolder.all

    @totalpastas = Actionfolder.count

    @totalencerrado = Actionfolder.where(status: "Encerrado").count

    @totalbaixado = Actionfolder.where(status: "Baixado").count
    
  end
end
