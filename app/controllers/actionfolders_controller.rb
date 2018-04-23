class ActionfoldersController < ApplicationController
  before_action :set_actionfolder, only: [:show, :edit, :update, :destroy]

  # GET /actionfolders
  # GET /actionfolders.json
  def index
    @actionfolders = Actionfolder.paginate(:page => params[:page], :per_page => 30)
  end

  # GET /actionfolders/1
  # GET /actionfolders/1.json
  def show
  end


  # GET /actionfolders/new
  def new
    @actionfolder = Actionfolder.new
  end

  # GET /actionfolders/1/edit
  def edit
  end

  # POST /actionfolders
  # POST /actionfolders.json
  def create
    @actionfolder = Actionfolder.new(actionfolder_params)

    respond_to do |format|
      if @actionfolder.save
        format.html { redirect_to @actionfolder, notice: 'Actionfolder was successfully created.' }
        format.json { render :show, status: :created, location: @actionfolder }
      else
        format.html { render :new }
        format.json { render json: @actionfolder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /actionfolders/1
  # PATCH/PUT /actionfolders/1.json
  def update
    respond_to do |format|
      if @actionfolder.update(actionfolder_params)
        format.html { redirect_to @actionfolder, notice: 'Actionfolder was successfully updated.' }
        format.json { render :show, status: :ok, location: @actionfolder }
      else
        format.html { render :edit }
        format.json { render json: @actionfolder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /actionfolders/1
  # DELETE /actionfolders/1.json
  def destroy
    @actionfolder.destroy
    respond_to do |format|
      format.html { redirect_to actionfolders_url, notice: 'Actionfolder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def apagar_todas
    @actionfolders = Actionfolder.all
    @actionfolders.delete_all
    respond_to do |format|
      format.html { redirect_to actionfolders_url, notice: 'Todas as pastas apagadas com sucesso.' }
      format.json { head :no_content }
    end 
  end


  def import_from_excel
    file = params[:file]
    begin
      file_ext = File.extname(file.original_filename)
      raise "Unknown file type: #{file.original_filename}" unless [".xls", ".xlsx"].include?(file_ext)
      spreadsheet = (file_ext == ".xls") ? Roo::Excel.new(file.path) : Roo::Excelx.new(file.path)
      header = spreadsheet.row(1)
      ## We are iterating from row 2 because we have left row one for header
      (2..spreadsheet.last_row).each do |i|
        Actionfolder.create(identifier: spreadsheet.row(i)[0], folder: spreadsheet.row(i)[1], lawyer: spreadsheet.row(i)[2], low_date: spreadsheet.row(i)[3], closing_date: spreadsheet.row(i)[4], status: spreadsheet.row(i)[5], action_result: spreadsheet.row(i)[6], uf: spreadsheet.row(i)[7])
      end
      flash[:notice] = "Records Imported"
      redirect_to actionfolders_path 
    rescue Exception => e
      flash[:notice] = "Issues with file"
      redirect_to actionfolders_path 
    end
 end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_actionfolder
      @actionfolder = Actionfolder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def actionfolder_params
      params.require(:actionfolder).permit(:identifier, :folder, :lawyer, :low_date, :closing_date, :status, :action_result, :uf)
    end
end
