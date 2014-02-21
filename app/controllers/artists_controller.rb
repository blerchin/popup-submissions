class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]
	before_action :set_artists, only: [:index]
	after_action :save_session_login, only: [:create]

	#before_action :artist_auth, except: [:new, :create]

  # GET /artists
  # GET /artists.json
  def index
    @artists = Artist.all
  end
	

  # GET /artists/1
  # GET /artists/1.json
  def show
		@exhibitions = Exhibition.open
	end

  # GET /artists/new
  def new
    @artist = Artist.new
  end

  # GET /artists/1/edit
  def edit
  end

  # POST /artists
  # POST /artists.json
  def create
    @artist = Artist.new(artist_params)

    respond_to do |format|
      if @artist.save
				ArtistMailer.signup_email(@artist).deliver
        format.html { redirect_to @artist, notice: 'Your data was saved.' }
        format.json { render action: 'show', status: :created, location: @artist }
      else
        format.html { render action: 'new' }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /artists/1
  # PATCH/PUT /artists/1.json
  def update
    respond_to do |format|
      if @artist.update(artist_params)
        format.html { redirect_to @artist, notice: 'Artist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artists/1
  # DELETE /artists/1.json
  def destroy
    @artist.destroy
    respond_to do |format|
      format.html { redirect_to artists_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist
      @artist = Artist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def artist_params
      params[:artist].permit(:first_name, :last_name, :email, :phone, :contact_city, :contact_state, :contact_postal, :contact_address_one, :contact_address_two, :status, :submissions_attributes => [ :id, :title, :medium, :year, :price, :delete])
    end

		def set_artist 
			#unless artist is viewing her own profile, 
			#she must be logged in as an admin user
			@artist = current_artist
			if params[:access_token]
				@artist = Artist.where(
											:access_token => params[:access_token],
											:id => params[:id]).take
				session[:current_artist_id] = @artist.id
			end

			unless params[:id] && params[:id].to_i == @artist.try(:id)
				authenticate
				@artist = Artist.find(params[:id])
			end
		end
		def set_artists
			authenticate
			@artists = Artist.all
		end

  	def save_session_login
			session[:current_artist_id] = @artist.id
  	end

end
