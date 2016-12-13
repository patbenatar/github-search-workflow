module GithubSearchWorkflow
  class Searcher
    def perform(query)
      if json = Cache.read
        data = JSON.parse(json)
        repos = data.map { |d| Repo.from_cache(d) }

        query_regexp = Regexp.new(query, 'i')
        results = repos.select { |r| r.name =~ query_regexp }
      end
    end
  end
end
