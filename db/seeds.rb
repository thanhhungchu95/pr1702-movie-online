3.times do |n|
  Film.create(
    name: "Film#{n+1}"
  )
end

3.times do |n|
  Genre.create(
    name: "Genre#{n+1}"
  )
end

3.times do |n|
  Origin.create(
    name: "Origin#{n+1}"
  )
end

3.times do |n|
  Episode.create(
    film_id: n,
    num_epi: n,
  )
end

3.times do |n|
  LinkEpisode.create(
    episode_id: n,
    link: n,
  )
end

Film.all.each do |film|
  Genre.all.each do |genre|
    FilmGenre.create(film_id: film.id, genre_id:genre.id)
  end
end

Film.all.each do |film|
  Origin.all.each do |genre|
    FilmOrigin.create(film_id: film.id, origin_id:genre.id)
  end
end
