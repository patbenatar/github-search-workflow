# GitHub Search Workflow for Alfred

Quickly find and launch the repositories you work on. This workflow fuzzy
searches your repos by name. Searched repositories include both public and
private repos for your user, as well as any organizations you belong to.

![Example](http://i.imgur.com/9a07zwz.png)

## Setup

1. Download and install [GitHub Repository Search.alfredworkflow](https://github.com/patbenatar/github-search-workflow/blob/master/GitHub Repository Search.alfredworkflow?raw=true)
1. [Create a GitHub auth token](https://help.github.com/articles/creating-an-access-token-for-command-line-use/)
1. Setup your auth credentials in `~/.netrc`
   ```
   machine api.github.com
     login YOUR_GITHUB_USERNAME
     password YOUR_AUTH_TOKEN
  ```
1. Make sure redis is installed and running

## Usage

### `gh TERM`

Search your repos for TERM. Select a repo to launch it in your default browser.
