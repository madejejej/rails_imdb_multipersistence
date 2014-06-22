  Actor.find_each do |actor|
    puts "Trying to save actor: "
    p actor.inspect
    $neo.create_node(fname: actor.fname, lname: actor.fname, mname: actor.mname, id: actor.id)
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
