require "test_helper"

class MovieTest < ActiveSupport::TestCase
  setup do
    @movie1 = Movie.new(title: "avengers", runtime_in_minutes: 153, rating: :pg, description: "this is a long description" )
  end

  test "movie is valid" do
    assert @movie1.valid?
  end

  test "title should be present" do
    @movie1.title = ""
    
    assert_not @movie1.valid?
  end

  test "runtime_in_minutes should be present" do
    @movie1.runtime_in_minutes = ""

    assert_not @movie1.valid?
  end

  test "rating should be present" do
    @movie1.rating = ""

    assert_not @movie1.valid?
  end

  test "should attach an image" do
    @movie1.image.attach(io: File.open(Rails.root.join('test', 'fixtures', 'files', 'icon.png')), filename: 'icon.png', content_type: 'image/png')
    
    assert @movie1.image.attached?
  end

  test "should create a valid movie" do
    movie = @movie1
    movie.image.attach(io: File.open(Rails.root.join('test', 'fixtures', 'files', 'icon.png')), filename: 'icon.png', content_type: 'image/png')

    movie.save
    assert movie.image.attached?

    assert movie.valid?
  end

end
