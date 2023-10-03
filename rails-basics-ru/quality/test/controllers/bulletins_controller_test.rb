require "test_helper"

class BulletinsControllerTest < ActionDispatch::IntegrationTest
  test 'see index page' do
    get '/bulletins'

    assert_response :success
    assert_select 'h1', 'Bulletins'
    assert_select 'p', 'Bulletin'
    assert_select 'p', 'Bulletin_2'
  end

  test 'see page bulletins' do
    get bulletin_path(bulletins(:bulletin_1))

    assert_response :success
    assert_select 'p', 'Bulletin'
    assert_select 'p', 'Text Bulletin'
  end
end
