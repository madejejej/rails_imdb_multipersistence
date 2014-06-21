require 'test_helper'

class Imdb::MoviesControllerTest < ActionController::TestCase
  setup do
    @imdb_movie = imdb_movies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:imdb_movies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create imdb_movie" do
    assert_difference('Imdb::Movie.count') do
      post :create, imdb_movie: {  }
    end

    assert_redirected_to imdb_movie_path(assigns(:imdb_movie))
  end

  test "should show imdb_movie" do
    get :show, id: @imdb_movie
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @imdb_movie
    assert_response :success
  end

  test "should update imdb_movie" do
    patch :update, id: @imdb_movie, imdb_movie: {  }
    assert_redirected_to imdb_movie_path(assigns(:imdb_movie))
  end

  test "should destroy imdb_movie" do
    assert_difference('Imdb::Movie.count', -1) do
      delete :destroy, id: @imdb_movie
    end

    assert_redirected_to imdb_movies_path
  end
end
