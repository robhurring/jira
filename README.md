# Jira

Small experiment using [httpoison](https://github.com/edgurgel/httpoison) and mapping some of the Jira REST API calls. Used as a small CLI script to run ad-hoc JQL from the command line and parse with a tool like [jq](https://github.com/stedolan/jq)

Not really too interesting.

## Installation

1. Clone repo
2. Run `mix deps.get`
3. Follow the [setup](#setup) steps below.
3. Run `mix escript.build`
4. Move `jira` to anywhere in `$PATH`

## Setup

Modify the [config.ex](https://github.com/robhurring/jira/blob/master/config/config.exs) file or add the following to your shell environment:

```sh
export JIRA_HOST="https://mycompany.atlassian.net/rest/api/latest"
export JIRA_LOGIN="my.account"
export JIRA_PASSWORD="s3cr1t"
```

## Usage

* To run some ad-hoc jql: `jira search "assignee = currentUser()" | jq .`
* To get a single issue: `jira issue DEV-1 | jq .`
