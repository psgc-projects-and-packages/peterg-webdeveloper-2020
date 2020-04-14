class MonthperiodsController < ApplicationController
  before_action :set_monthperiod, only: [:show, :edit, :update, :destroy]

  # GET /monthperiods
  # GET /monthperiods.json
  def index
    @monthperiods = Monthperiod.all
  end

  # GET /monthperiods/1
  # GET /monthperiods/1.json
  def show
  end

  # GET /monthperiods/new
  def new
    @monthperiod = Monthperiod.new
  end

  # GET /monthperiods/1/edit
  def edit
  end

  # POST /monthperiods
  # POST /monthperiods.json
  def create
    @monthperiod = Monthperiod.new(monthperiod_params)

    respond_to do |format|
      if @monthperiod.save
        format.html { redirect_to @monthperiod, notice: 'Monthperiod was successfully created.' }
        format.json { render :show, status: :created, location: @monthperiod }
      else
        format.html { render :new }
        format.json { render json: @monthperiod.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /monthperiods/1
  # PATCH/PUT /monthperiods/1.json
  def update
    respond_to do |format|
      if @monthperiod.update(monthperiod_params)
        format.html { redirect_to @monthperiod, notice: 'Monthperiod was successfully updated.' }
        format.json { render :show, status: :ok, location: @monthperiod }
      else
        format.html { render :edit }
        format.json { render json: @monthperiod.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monthperiods/1
  # DELETE /monthperiods/1.json
  def destroy
    @monthperiod.destroy
    respond_to do |format|
      format.html { redirect_to monthperiods_url, notice: 'Monthperiod was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monthperiod
      @monthperiod = Monthperiod.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def monthperiod_params
      params.require(:monthperiod).permit(:guid, :slug, :period_year, :month_number, :start_date, :end_date)
    end
end
