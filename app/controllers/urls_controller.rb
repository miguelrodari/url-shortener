class UrlsController < ApplicationController
  before_action :set_url, only: %i[ edit update destroy ]

  # GET /urls or /urls.json
  def index
    @urls = Url.get_top_visits
  end

  # GET /urls/1 or /urls/1.json
  def show
    @url = Url.find(params[:id])
    @url.increment_visits
    redirect_to @url.url
  end

  def redirect
    @url = Url.find_by(short_url: params[:short_url])
    @url.increment_visits
    redirect_to @url.url
  end

  # GET /urls/new
  def new
    @url = Url.new
  end

  # GET /urls/1/edit
  def edit
  end

  # POST /urls or /urls.json
  def create
    @url = Url.find_or_create_by(url: url_params[:url])

    if @url.short_url.nil?
      @url.set_short_url
    end

    respond_to do |format|
      if @url.save
        format.html { redirect_to url_url(@url), notice: "Url was successfully created." }
        format.json { render :show, status: :created, location: @url }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @url.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /urls/1 or /urls/1.json
  def update
    respond_to do |format|
      if @url.update(url_params)
        format.html { redirect_to url_url(@url), notice: "Url was successfully updated." }
        format.json { render :show, status: :ok, location: @url }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @url.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /urls/1 or /urls/1.json
  def destroy
    @url.destroy

    respond_to do |format|
      format.html { redirect_to urls_url, notice: "Url was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_url
      @url = Url.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def url_params
      params.require(:url).permit(:url, :title)
    end
end
