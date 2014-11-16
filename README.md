# GitHub Search Workflow for Alfred

Easily find and launch the repositories you work on. This workflow fuzzy
searches your repos by name. Searched repositories include both public and
private repos for your user, as well as any organizations you belong to.

![Example](http://i.imgur.com/9a07zwz.png)

## Setup

1. Install the bundle into system ruby
1. Get your auth token: https://help.github.com/articles/creating-an-access-token-for-command-line-use/
1. Setup auth in `~/.netrc`: https://github.com/octokit/octokit.rb#using-a-netrc-file
1. Make sure redis is installed and running
