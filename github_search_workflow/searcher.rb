module GithubSearchWorkflow
  class Searcher
    def perform(query)
      if json = Cache.read
        data = JSON.parse(json)
        repos = data.map { |d| Repo.from_cache(d) }

        matcher = FuzzyMatch.new(repos, read: :name)
        matcher.find(query)
      end
    end
  end
end
