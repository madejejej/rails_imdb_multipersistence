
  Actor.find_each do |actor|
    $neo.create_node(fname: actor.fname, lname: actor.fname, mname: actor.mname, id: actor.idactors)
    $neo.add_label(actor.id, 'Actor')
  end

  puts "Actor batch saved!"

  Movie.find_each do |movie|
    $neo.create_node(title: movie.title, id: movie.idmovies)
    $neo.add_label(movie.id, 'Movie')
  end

  puts "Movie batch saved!"

  Series.find_each do |series|
    $neo.create_node(name: series.name, id: series.idseries)
    $neo.add_label(series.id, 'Series')
  end


  ActedIn.find_each do |rel|
    rel.neo_save
  end

  puts "ActedIn batch saved!"
