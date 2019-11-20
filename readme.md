# Chef Repo for Barito Log

Infrastructure as a code.

## Setup

* `bundle install`
* Bootstrap chef (1st time) : `knife solo bootstrap user@host nodes/xxxxxx.json`
* Running recipe : `knife solo cook user@host nodes/yyyyyy.json`

## Update cookbooks depedency

We need to do these whenever we have to update cookbooks depedencies:

1. Run
```
bundle exec berks update
bundle exec berks vendor cookbooks
```

2. Commit and updated `cookbooks` directory