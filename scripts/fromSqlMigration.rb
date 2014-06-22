  Actor.find_each do |actor|
    actor.neo_save
    puts "Actor saved!"
  end

  puts "Actor batch saved!"

  Movie.find_each do |movie|
    movie.neo_save
  end

  puts "Movie batch saved!"


  ActedIn.find_each do |rel|
    rel.neo_save
  end

  puts "ActedIn batch saved!"
