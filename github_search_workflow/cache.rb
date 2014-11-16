module GithubSearchWorkflow
  module Cache
    def self.write(data)
      REDIS.set 'github_search_workflow:repos', data
    end

    def self.read
      REDIS.get('github_search_workflow:repos')
    end

    def self.clear
      REDIS.del('github_search_workflow:repos')
    end
  end
end
