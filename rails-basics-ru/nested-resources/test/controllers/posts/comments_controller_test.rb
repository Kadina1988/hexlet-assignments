require "test_helper"

class Posts::CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment = post_comments(:one)
    @attr = {body: Faker::ChuckNorris.fact}
  end

  test 'should get edit' do
    get edit_comment_url(@comment)

    assert_response :success
  end

  test 'should get update' do
    @comment = post_comments(:one)
    patch comment_url(@comment), params: { body: 'Update'}

    @comment.reload

    assert { @comment.body == 'Update' }
    assert_redirected_to post_url(@comment.post)
  end

  test 'should get create' do
    post = posts(:one)
    assert_difference('PostComment.count') do
      post post_comments_url(post), params: { body: 'New' }
    end

    assert_redirected_to post_url(post)
    assert_equal 'ura', flash[:success]
  end

  # test 'should get destroy' do
  #   post = posts(:one)

  #   delete comment_url(@comment)

  #   assert{!PostComment.exists?(@comment.id)}

  #   assert_redirected_to post_url(post)
  # end
end
