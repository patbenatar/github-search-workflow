module GithubSearchWorkflow
  class Runner < Struct.new(:query)
    def call
      xml.instruct!

      if query == 'refresh!'
        refresh
      else
        if result = searcher.perform(query)
          xml.items do
            xml.item autocomplete: result.name, arg: result.url do
              xml.title result.name
              xml.subtitle "Open #{result.url}"
            end
          end
        else
          refresh
        end
      end
    end

    private

    def xml
      @xml ||= Builder::XmlMarkup.new(target: STDOUT, indent: 2)
    end

    def refresh
      xml.items do
        xml.item valid: 'no' do
          xml.title 'Refreshing cache. Return shortly for fresh results.'
        end
      end

      exec File.join(File.dirname(__FILE__), '..', 'fetch')
    end

    def searcher
      @searcher ||= GithubSearchWorkflow::Searcher.new
    end
  end
end
