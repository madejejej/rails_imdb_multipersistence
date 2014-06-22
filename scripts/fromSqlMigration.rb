  @actors = Hash.new
  Actor.find_each do |actor|
    @node = $neo.create_node(fname: actor.fname, lname: actor.fname, mname: actor.mname)
    @actors[actor.id] = @node
    $neo.add_label(actor.id, 'Actor')
  end

  puts "Actor batch saved!"
  @movies = Hash.new
  Movie.find_each do |movie|
    @node = $neo.create_node(title: movie.title, id: movie.idmovies)
    @movies[movie.idmovies] = @node
    $neo.add_label(movie.id, 'Movie')
  end

  puts "Movie batch saved!"

  @series = Hash.new
  Series.find_each do |series|
    @node = $neo.create_node(name: series.name, id: series.idseries)
    @series[series.idseries] = @node
    $neo.add_label(series.id, 'Series')
  end


  ActedIn.find_each do |rel|
    @actorNode = actors[rel.idactors]

  end

  puts "ActedIn batch saved!"
