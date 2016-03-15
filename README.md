# Jira

Small experiment using edgurgel/httpoison and mapping some of the Jira REST API calls. Used as a small CLI script to run ad-hoc JQL from the command line and parse with a tool like stedolan/jq

Not really too interesting.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add jira to your list of dependencies in `mix.exs`:

        def deps do
          [{:jira, "~> 0.0.1"}]
        end

  2. Ensure jira is started before your application:

        def application do
          [applications: [:jira]]
        end

## Setup

Modify the [config.ex](https://github.com/robhurring/jira/blob/master/config/config.exs) file or add the following to your shell environment:

```sh
export JIRA_HOST="https://mycompany.atlassian.net/rest/api/latest"
export JIRA_LOGIN="my.account"
export JIRA_PASSWORD="s3cr1t"
```

## Usage

* To run some ad-hoc jql: `jira jql "assignee = currentUser()" | jq .`
* To get a single issue: `jira issue DEV-1 | jq .`
