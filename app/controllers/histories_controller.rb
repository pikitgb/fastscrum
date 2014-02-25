class HistoriesController < ApplicationController
  before_action :set_history, only: [:show, :edit, :update, :destroy]
  before_action :set_project

  # GET /histories
  # GET /histories.json
  def index
    @histories = History.all
  end

  # GET /histories/1
  # GET /histories/1.json
  def show
  end

  # GET /histories/new
  def new
    @history = History.new
  end

  # GET /histories/1/edit
  def edit
  end

  # POST /histories
  # POST /histories.json
  def create
    @history = @project.histories.build(history_params)

    respond_to do |format|
      if @history.save
        format.html { redirect_to project_history_path(@project, @history), notice: 'History was successfully created.' }
        format.json { render action: 'show', status: :created, location: @history }
      else
        format.html { render action: 'new' }
        format.json { render json: @history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /histories/1
  # PATCH/PUT /histories/1.json
  def update
    respond_to do |format|
      if @history.update(history_params)
        format.html { redirect_to @history, notice: 'History was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @history.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /history/1/move_to
  def move_to
    @history = History.find params[:history_id]
    respond_to do |format|
      if @history.update_attributes(state: params[:phase])
        format.html { redirect_to :back, notice: 'History was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @history.errors, status: :unprocessable_entity }
      end
    end

  end

  # DELETE /histories/1
  # DELETE /histories/1.json
  def destroy
    @history.destroy
    respond_to do |format|
      format.html { redirect_to project_histories_url(@project) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_history
      @history = History.find(params[:id])
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def history_params
      params.require(:history).permit(:name, :puntuation, :finished_definition, :comments, :project_id)
    end
end
