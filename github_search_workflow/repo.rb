module GithubSearchWorkflow
  class Repo
    attr_reader :name, :url

    def initialize(attributes = {})
      @name = attributes[:name]
      @url = attributes[:url]
    end

    def self.from_github(data)
      new(name: data.full_name, url: data.html_url)
    end

    def self.from_cache(data)
      new(name: data['name'], url: data['url'])
    end

    def to_cache
      {
        'name' => name,
        'url' => url
      }
    end

    def inspect
      name
    end
  end
end
