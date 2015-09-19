module GithubSearchWorkflow
  class Fetcher
    def perform
      require 'octokit'

      client = Octokit::Client.new(access_token: File.read('.auth_token').strip)

      user_repos = paginate client.repos, client

      user_orgs = client.orgs
      org_repos = user_orgs
        .map { |o| paginate(client.get(o.rels[:repos].href), client) }.flatten

      repos = (user_repos + org_repos).map { |r| Repo.from_github(r) }
      repos.uniq!(&:url)

      Cache.write(repos.map(&:to_cache).to_json)
    end

    private

    def paginate(data, client)
      if next_page = client.last_response.rels[:next]
        paginate((data + client.get(next_page.href)), client)
      else
        data
      end
    end
  end
end
