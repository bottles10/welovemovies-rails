class MoviesController < ApplicationController
    before_action :set_movie, only: %i[show]

    def index
        @movies = Movie.all
    end

    def show
    end

    def new
        @movie = Movie.new
    end

    def create
        @movie = Movie.new(movie_params)

        respond_to do |format|
            if @movie.save
                format.html { redirect_to @movie, notice: "Movie was successfuly saved!" }
                format.json { render :show, status: :created, location: @movie }

            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @movies.errors, status: :unprocessable_entity }
            end
        end
    end





    private
        def set_movie
            @movie = Movie.find(params[:id])
        end

        def movie_params
            params.require(:movie).permit(:title, :runtime_in_minutes, :rating, :description, :image )
        end
end
