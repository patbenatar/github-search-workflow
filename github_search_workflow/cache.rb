module GithubSearchWorkflow
  module Cache
    def self.write(data)
      File.open('.result_cache', 'w') do |file|
        file.truncate(0)
        file.puts data
      end
    end

    def self.read
      File.read('.result_cache') if File.exist?('.result_cache')
    end

    def self.clear
      File.delete('.result_cache')
    end
  end
end
