class AliasesController < ApplicationController
  before_action :set_alias, only: [:show, :edit, :update, :destroy]

  # GET /aliases
  # GET /aliases.json
  def index
    @aliases = Alias.all
  end

  # GET /aliases/1
  # GET /aliases/1.json
  def show
  end

  # GET /aliases/new
  def new
    @alias = Alias.new
  end

  # GET /aliases/1/edit
  def edit
  end

  # POST /aliases
  # POST /aliases.json
  def create
    @alias = Alias.new(alias_params)

    respond_to do |format|
      if @alias.save
        format.html { redirect_to @alias, notice: 'Alias was successfully created.' }
        format.json { render :show, status: :created, location: @alias }
      else
        format.html { render :new }
        format.json { render json: @alias.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aliases/1
  # PATCH/PUT /aliases/1.json
  def update
    respond_to do |format|
      if @alias.update(alias_params)
        format.html { redirect_to @alias, notice: 'Alias was successfully updated.' }
        format.json { render :show, status: :ok, location: @alias }
      else
        format.html { render :edit }
        format.json { render json: @alias.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aliases/1
  # DELETE /aliases/1.json
  def destroy
    @alias.destroy
    respond_to do |format|
      format.html { redirect_to aliases_url, notice: 'Alias was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alias
      @alias = Alias.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def alias_params
      params.require(:alias).permit(:username, :email, :user_id)
    end
end
