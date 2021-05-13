class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show edit update destroy update_director update_description update_image update_duration]

  # GET /movies or /movies.json
  def index
    @movies = Movie.all
    @movie = Movie.new
  end

  # GET /movies/1 or /movies/1.json
  def show
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  
  end

  def edit_title
    @movie = Movie.find(params[:id])
    
      #format.js { render template: "movies/edit_title.js.erb" }
      respond_to do |format|
        format.js {render template: "movies/edit_title.js.erb"}
      end
    
  end

  def edit_director
    @movie = Movie.find(params[:id])
    
      #format.js { render template: "movies/edit_title.js.erb" }
      respond_to do |format|
        format.js {render template: "movies/edit_director.js.erb"}
      end
    
  end

  def edit_description
    @movie = Movie.find(params[:id])
    
      #format.js { render template: "movies/edit_title.js.erb" }
      respond_to do |format|
        format.js {render template: "movies/edit_description.js.erb"}
      end
    
  end

  def edit_image
    @movie = Movie.find(params[:id])
    
      #format.js { render template: "movies/edit_title.js.erb" }
      respond_to do |format|
        format.js {render template: "movies/edit_image.js.erb"}
      end
    
  end

    def edit_duration
    @movie = Movie.find(params[:id])
    
      #format.js { render template: "movies/edit_title.js.erb" }
      respond_to do |format|
        format.js {render template: "movies/edit_duration.js.erb"}
      end
    
  end


  # POST /movies or /movies.json
  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: "Movie was successfully created." }
        format.json { render :show, status: :created, location: @movie }
        format.js { render template: "movies/create.js.erb" }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1 or /movies/1.json
  def update
    @title = params.fetch(:movie).fetch(:title)


    #@director_id = params.fetch(:movie).fetch(:director_id)
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: "Movie was successfully updated." }
        format.json { render :show, status: :ok, location: @movie }
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end
  #PATCH "/movies/:id/director_id/update"
  def update_director
    #@title = params.fetch(:movie).fetch(:title)
    @title = @movie.title
    @director_id = @movie.director_id


    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: "Movie was successfully updated." }
        format.json { render :show, status: :ok, location: @movie }
        format.js { render template: "movies/update_director.js.erb"}
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

    def update_description
    #@title = params.fetch(:movie).fetch(:title)
    @title = @movie.title
    @director_id = @movie.director_id
    @description = @movie.description


    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: "Movie was successfully updated." }
        format.json { render :show, status: :ok, location: @movie }
        format.js { render template: "movies/update_description.js.erb"}
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_image
    #@title = params.fetch(:movie).fetch(:title)
    @title = @movie.title
    @director_id = @movie.director_id
    @description = @movie.description
    @image = @movie.image


    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: "Movie was successfully updated." }
        format.json { render :show, status: :ok, location: @movie }
        format.js { render template: "movies/update_image.js.erb"}
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_duration
    #@title = params.fetch(:movie).fetch(:title)
    @title = @movie.title
    @director_id = @movie.director_id
    @description = @movie.description
    @image = @movie.image
    @duration = @movie.duration


    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: "Movie was successfully updated." }
        format.json { render :show, status: :ok, location: @movie }
        format.js
        #format.js { render template: "movies/update_image.js.erb"}
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1 or /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: "Movie was successfully destroyed." }
      format.json { head :no_content }
      format.js 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movie_params
      params.require(:movie).permit(:title, :description, :duration, :image, :year, :director_id)
    end
end
