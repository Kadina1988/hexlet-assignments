module Web
  module Movies
    class ReviewsController < Web::Movies::ApplicationController
      before_action :find_review, except: %i[index new create]
      def index
        @reviews = resource_movie.reviews
      end

      def new
        @review = resource_movie.reviews.build
      end

      def create
        @review = resource_movie.reviews.build(review_params)
        @review.save
        redirect_to movie_reviews_path(resource_movie)
      end

      def edit
      end

      def update
        @review.update(review_params)
        redirect_to movie_reviews_path(resource_movie)
      end

      def destroy
        @review.destroy
        redirect_to movie_reviews_path(resource_movie)
      end

      private

      def review_params
        params.require(:review).permit(:body)
      end

      def find_review
        @review = resource_movie.reviews.find(params[:id])
      end
    end
  end
end
