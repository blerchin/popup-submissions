class SubmissionsController < ApplicationController
	before_action :set_artist
  before_action :set_submission, only: [:show, :edit, :update, :destroy]

  # GET /submissions
  # GET /submissions.json
  def index
		authenticate
		render 'bulk_edit'
  end

  # GET /submissions/1
  # GET /submissions/1.json
  def show
  end

  # GET /submissions/new
  def new
    @submission = Submission.new
  end

  # GET /submissions/1/edit
  def edit
  end

  # POST /submissions
  # POST /submissions.json
	#
  def create
		@artist = current_artist
		@submission = Submission.new(submission_params)

		@submission.slide = submission_upload
		respond_to do |format|
			if @submission.save
				format.json { render json: @submission, status: :ok}
			else
				format.json { render json: @submission.errors[:slide], status: 422}
			end
		end
  end

  # PATCH/PUT /submissions/1
  # PATCH/PUT /submissions/1.json
  def update
    respond_to do |format|
      if @submission.update(submission_params)
        format.html { redirect_to @submission, notice: 'Submission was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /submissions/1
  # DELETE /submissions/1.json
  def destroy
		app_id = @submission.application_id
    @submission.destroy
    respond_to do |format|
			format.html { redirect_to application_path(app_id) }
      format.json { head :ok }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submission
			@submission = Submission.find(params[:id])
			authorize(@submission.artist_id)

    end

		def set_artist
			@artist = params[:artist_id] ? Artist.find(params[:artist_id]) : current_artist
		end

    # Never trust parameters from the scary internet, only allow the white list through.
    def submission_params
      params.require(:submission).permit(:title, :year, :medium, :price, :application_id, :artist_id )
    end
		def submission_upload
			params[:file]
		end
end
