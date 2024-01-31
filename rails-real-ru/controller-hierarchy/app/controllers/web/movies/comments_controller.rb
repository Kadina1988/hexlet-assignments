module Web
  module Movies
    class CommentsController < Web::Movies::ApplicationController

      def index
        @comments = resource_movie.comments
      end

      def new
        @comment = resource_movie.comments.build
      end

      def create
        @comment = resource_movie.comments.build(comment_params)
        @comment.save
        redirect_to movie_comments_path(resource_movie)
      end

      def edit
        @comment = resource_movie.comments.find(params[:id])
      end

      def update
        @comment = resource_movie.comments.find(params[:id])
        @comment.update(comment_params)
        redirect_to movie_comments_path(resource_movie)
      end

      def destroy
        @comment = resource_movie.comments.find(params[:id])
        @comment.destroy
        redirect_to movie_comments_path(resource_movie)
      end

      private

      def comment_params
        params.require(:comment).permit(:body)
      end
    end
  end
end
