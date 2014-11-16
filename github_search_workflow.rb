require 'amatch'
require 'builder'
require 'redis'
require 'json'

module GithubSearchWorkflow
  REDIS = Redis.new
end

require_relative 'github_search_workflow/cache'
require_relative 'github_search_workflow/fetcher'
require_relative 'github_search_workflow/repo'
require_relative 'github_search_workflow/searcher'
require_relative 'github_search_workflow/runner'
