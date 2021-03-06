class MoviesService
  class << self
    def get_top_rated_movies
      response1 = conn.get('/3/movie/top_rated?&page=1')
      parsed1 = parse_json(response1)
      response2 = conn.get('/3/movie/top_rated?&page=2')
      parsed2 = parse_json(response2)
      parsed1[:results] + parsed2[:results]
    end

    def get_search_results(search_params)
      response_searched1 = conn.get("/3/search/movie?&query=#{search_params}&page=1")
      parsed_searched1 = parse_json(response_searched1)
      response_searched2 = conn.get("/3/search/movie?&query=#{search_params}&page=2")
      parsed_searched2 = parse_json(response_searched2)
      parsed_searched1[:results] + parsed_searched2[:results]
    end

    def get_movie_details(movie_id)
      response = conn.get("/3/movie/#{movie_id}")
      parse_json(response)
    end

    def get_movie_cast(movie_id)
      response = conn.get("/3/movie/#{movie_id}/credits")
      parse_json(response)
    end

    def get_movie_reviews(movie_id)
      response = conn.get("/3/movie/#{movie_id}/reviews")
      parse_json(response)
    end

    private

    def conn
      Faraday.new(
        url: 'https://api.themoviedb.org',
        params: {
          api_key: ENV['movie_db_api'],
          language: 'en-US'
        }
      )
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
