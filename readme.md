# Bullet Journal

**This is a work in progress, subject to change, and is not guaranteed to be accurate.**

A simple ruby gem that makes it easier to manage a bullet journal inspired personal notes system via a series of markdown files using a terminal executable called `bj`. 

Read more on the projects [home page](http://robgough.net/bullet-journal)

## How to use

After a `gem install bullet_journal` you should be able to call the bullet journal with the following (this is subject to change)

```bash
  bj [date-modifier] [additional-date-modifier] [journal name]
```

  The problem with this is trying to be too clever, we're going
  to have to carefully limit what the possible options for the
  date modifier are allowed to be. For now, they are;

    `today` (default)
    `tomorrow`
    `yesterday`
    `last <weekday>` (where <weekday> is monday, tuesday, wednesday...)
    `last week` the Friday of the previous week
    `next <weekday>`
    `next week` the following Monday
    `someday` a special undated case

  Examples;

    `bulletjournal` => "JOURNAL_2021-01-01_Friday.md"
    `bulletjournal today` => "JOURNAL_2021-01-01_Friday.md"
    `bulletjournal yesterday` => "JOURNAL_2020_12_31_Thursday.md"
    `bulletjournal yesterday banana` => "BANANA_2020_12_31_Thursday.md"
    `bulletjournal next tuesday` => "JOURNAL_2021-01-05_Tuesday.md"
    `blletjournal next tuesday banana` => "BANANA_2021-01-05_Tuesday.md"
    `bulletjournal someday` => "JOURNAL_Someday.md"

This can be used on the terminal in conjunction with your favourite editor;

```bash
nvim $(ruby bullet_journal.rb today)
```

This might have limited utility for the moment, but can be used inside zsh functions (this matches my current functionality) and is intended to be replaced in the future.

## Testing

All tests can be ran with:

```bash
rake test
```

## Config



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
  - [x] weekday (e.g. `bj monday`)
- [ ] re-implement parser
- [ ] implement `bj n days ago` parsing
- [x] launch directly into an editor
- [x] Turn into a ruby gem with an executable
- [ ] release the gem!
- [ ] read from a config file `~/.config/bullet_journal/config.yml`
  - [x] central notes location
  - [x] journal-specific notes location
  - [x] default journal name (original is "JOURNAL")
  - [ ] whitelist only acceptable journal names
  - [ ] editor of choice
- [ ] create config file if missing
- [ ] accept a more rigid argument input in addition to lazy freetext
- [ ] view outstanding/incomplete items
  - allow parsing through a journals files and spotting/triaging any outstanding items, including moving them forward to specific days
- [ ] creating a default template for a day
- [ ] quick browse (show summary of recent days)
