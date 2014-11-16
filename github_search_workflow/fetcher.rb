module GithubSearchWorkflow
  class Fetcher
    def perform
      require 'octokit'
      require 'netrc'

      client = Octokit::Client.new(netrc: true)
      client.auto_paginate = true

      user_repos = client.repos

      user_orgs = client.orgs
      org_repos = user_orgs.map { |o| o.rels[:repos].get.data }.flatten

      repos = (user_repos + org_repos).map { |r| Repo.from_github(r) }

      Cache.write(repos.map(&:to_cache).to_json)
    end
  end
end
