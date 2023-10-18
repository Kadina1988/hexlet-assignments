class Posts::CommentsController < Posts::ApplicationController
  before_action :find_comment, only: [:edit, :update, :destory]

  def edit;end

  def update
    if @comment.update(params.permit(:body, @comment.post.id))
      flash[:success] = 'Edited'
      redirect_to post_path(@comment.post)
    else
      render :edit
    end
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)

    if @comment.save!
      flash[:success] = 'ura'
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end

  def destroy
    if @comment.present?
      @comment.destroy
    end
    redirect_to post_path(@comment.post), status: :see_other
  end

  private

  def find_comment
    @comment = PostComment.find(params[:id])
  end

  def comment_params
    params.permit(:body)
  end
end
