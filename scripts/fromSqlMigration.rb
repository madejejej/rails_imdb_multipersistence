  # Actor.limit(100).each do |actor|
  #  node = $neo.create_node(fname: actor.fname, lname: actor.fname, mname: actor.mname, actor_id: actor.id)
  #  $neo.add_label(node, 'Actor')
  #  print "+"
  #end

  #puts "Actor batch saved!"

  #Movie.limit(100).each do |movie|
  #  node = $neo.create_node(title: movie.title, movie_id: movie.idmovies)
  #  $neo.add_label(node, 'Movie')
  #  print '+'
  #end

  #puts "Movie batch saved!"

  #Series.limit(100).each do |series|
  #  node = $neo.create_node(name: series.name, series_id: series.idseries)
  #  $neo.add_label(node, 'Series')
  #  print '+'
  #end

  #ActedIn.limit(100).each do |rel|

  #end

$neo.create_relationship_index('acted_ins')
Actor.includes(:movies).find_each do |actor|
    node = $neo.create_node(fname: actor.fname, lname: actor.fname, mname: actor.mname, actor_id: actor.id)
    $neo.add_label(node, 'Actor')
    $neo.add_node_to_index('actors', 'actor_id', actor.id, $neo.get_id(node), true)

    movie_node = nil
    actor.movies.each do |movie|
      begin
        movie_node = $neo.find_node_index('movies', 'movie_id', movie.idmovies)
        raise StandardError if movie_node.nil?
      rescue
        movie_node = $neo.create_node(title: movie.title, movie_id: movie.idmovies)
        $neo.add_label(movie_node, 'Movie')
        $neo.add_node_to_index('movies', 'movie_id', movie.idmovies, $neo.get_id(movie_node), true)
      ensure
        $neo.create_relationship('ACTED_IN', node, movie_node)
      end
    end

    print "+"
  end


