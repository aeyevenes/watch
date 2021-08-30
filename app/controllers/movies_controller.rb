class MoviesController < ApplicationController
  def create
    @movie = Movie.new(review_params)
    @list = List.find(params[:list_id])
    @movie.list = @list
    if @movie.save
      redirect_to list_path(@list)
    else
      render 'lists/show'
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to list_path(@movie.list)
  end

  private

  def movie_params
    params.require(:movie_id).permit(:comment, :rating)
  end
end
