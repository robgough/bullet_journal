# Bullet Journal

**This is still a work in progress and subject to change.**

A simple ruby gem that makes it easier to manage a bullet journal inspired personal notes system via a series of markdown files using a terminal executable called `jo`.

[Read more about it](https://robgough.net/bullet-journal).

## Testing

All tests can be ran with:

```bash
rake test
```

## To Do

- [x] basic functionality
  - [x] someday
  - [x] today
  - [x] yesterday
  - [x] tomorrow
  - [x] specify non-default journal
  - [x] next weekday
  - [x] last weekday
  - [x] next week
  - [x] last week
  - [x] weekday (e.g. `jo monday`)
- [ ] re-implement parameter parsing properly
- [ ] implement `jo n days ago` parsing
- [x] launch directly into an editor
- [x] Turn into a ruby gem with an executable
- [ ] release the gem!
- [ ] read from a config file `~/.config/bullet_journal/config.yml`
  - [x] central notes location
  - [x] journal-specific notes location
  - [x] default journal name (original is "JOURNAL")
  - [ ] whitelist only acceptable journal names
  - [x] editor of choice
- [x] create config file if missing
- [ ] accept a more rigid argument input in addition to lazy freetext
- [ ] view outstanding/incomplete items
  - allow parsing through a journals files and spotting/triaging any outstanding items, including moving them forward to specific days
- [ ] creating a default template for a day
- [ ] quick browse (show summary of recent days)
