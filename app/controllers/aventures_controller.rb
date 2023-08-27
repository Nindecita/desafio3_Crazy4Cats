class AventuresController < ApplicationController
  before_action :set_aventure, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ new create edit update destroy]
  # GET /aventures or /aventures.json
  def index
    @aventures = Aventure.all
  end

  # GET /aventures/1 or /aventures/1.json
  def show
    @comments = @aventure.comments.order(id: :desc)
    @comment = @aventure.comments.build
  end

  # GET /aventures/new
  def new
    @aventure = Aventure.new
  end

  # GET /aventures/1/edit
  def edit
  end

  # POST /aventures or /aventures.json
  def create
    @aventure = Aventure.new(aventure_params)
    @aventure.user_id = current_user.id
    respond_to do |format|
      if @aventure.save
        format.html { redirect_to aventure_url(@aventure), notice: "La aventura fue creada con éxito." }
        format.json { render :show, status: :created, location: @aventure }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @aventure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aventures/1 or /aventures/1.json
  def update
    respond_to do |format|
      if @aventure.update(aventure_params)
        format.html { redirect_to aventure_url(@aventure), notice: "La aventura fue actualizada con éxito." }
        format.json { render :show, status: :ok, location: @aventure }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @aventure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aventures/1 or /aventures/1.json
  def destroy
    @aventure.destroy

    respond_to do |format|
      format.html { redirect_to aventures_url, notice: "La aventura fue eliminada con éxito." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aventure
      @aventure = Aventure.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def aventure_params
      params.require(:aventure).permit(:title, :description, :image)
    end
end
