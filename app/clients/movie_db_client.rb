class MovieDbClient
  API_KEY = "28411513177d817a44094ffcd650b766"
  READ_ONLY_TOKEN = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyODQxMTUxMzE3N2Q4MTdhNDQwOTRmZmNkNjUwYjc2NiIsIm5iZiI6MTcyNDM1NTQyMS44MDkxODgsInN1YiI6IjY2Yzc5MjhiN2I4YmUxOWQ4MDVlYjgwOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.WcNqXtkOCWkoyKvR86_eu4zgeTv-DXupF3oZtljrLLY"
  def initialize 

  end

  def search(query)
    query_params = {query:, api_key:}

    response = Faraday.get(search_url, query_params)
    data = JSON.parse(response.body)
    binding.pry
    data.only(:name, :description)
  end

  def search_url
    base_url + search_terms
  end

  def base_url
    "https://api.themoviedb.org/3"
  end

  def search_terms
    "/search/movie"
  end

  def api_key
    API_KEY
  end
end