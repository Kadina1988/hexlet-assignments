# frozen_string_literal: true

require 'application_system_test_case'

# BEGIN
class PostsTest < ApplicationSystemTestCase
  setup do
    @post = posts(:one)
  end

  test 'viewing the posts' do
    visit posts_path
    assert_selector 'h1', text: 'Posts'
  end

  test 'viewing the post' do
    visit post_path(@post)
    assert_selector 'h1', text: "#{@post.title}"
  end

  test 'should create Post' do
    visit posts_path

    click_on 'New Post'

    fill_in 'Title', with: 'Creating a new Post'
    fill_in 'Body', with: 'Creating body'

    click_on 'Create Post'

    assert_text 'Post was successfully created.'
  end

  test 'should update Post' do
    visit post_path(@post)

    find('#my-link').click
    fill_in 'Title', with: 'Update the Post'
    fill_in 'Body', with: 'new body'

    click_on 'Update'

    assert_text 'Post was successfully updated.'
  end

  test 'should delete Post' do
    visit post_path(@post)

    page.accept_confirm do
      click_on 'Delete', match: :first
    end

    assert_text 'Post was successfully destroyed.'
  end
end
# END
