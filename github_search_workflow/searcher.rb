module GithubSearchWorkflow
  class Searcher
    def perform(query)
      if json = Cache.read
        data = JSON.parse(json)
        repos = data.map { |d| Repo.from_cache(d) }

        matcher = Amatch::LongestSubstring.new(query)
        repos.sort_by { |r| matcher.match(r.name) }.reverse.first(6)
      end
    end
  end
end
