# BulletJournal

A simple ruby gem to aid in keeping one or more journals made of just markdown files.

The initial version is simply concerned with reducing friction when creating markdown files, and replacing what is currently a collection of zsh functions. It allows you to pass in some free text, and get back an appropriate filename. Used in conjunction with your editor of choice, it's rather handy.

## How to use

How you can call the `bulletjournal`
  bulletjournal [date-modifier (optional)]
    [additional-date-modifier (optional)]
    [journal name (optional)]

  The problem with this is trying to be too clever, we're going
  to have to carefully limit what the possible options for the
  date modifier are allowed to be. For now, they are;

    - `today` (default)
    - `tomorrow`
    - `yesterday`
    - `last <weekday>` (where <weekday> is Monday, Tuesday, Wednesday...)
    - `last week` the monday of the previous week
    - `next <weekday>`
    - `next week` the following Monday
    - `someday` a special undated case

  Examples;

    - `bulletjournal` => "JOURNAL_2021-01-01_Friday.md"
    - `bulletjournal today` => "JOURNAL_2021-01-01_Friday.md"
    - `bulletjournal yesterday` => "JOURNAL_2020_12_31_Thursday.md"
    - `bulletjournal yesterday banana` => "BANANA_2020_12_31_Thursday.md"
    - `bulletjournal next tuesday` => "JOURNAL_2021-01-05_Tuesday.md"
    - `blletjournal next tuesday banana` => "BANANA_2021-01-05_Tuesday.md"
    - `bulletjournal someday` => "JOURNAL_Someday.md"

This can be used on the terminal in conjunction with your favourite editor;

```bash
nvim $(ruby bullet_journal.rb today)
```

This might have limited utility for the moment, but can be used inside zsh functions (this matches my current functionality) and is intended to be replaced in the future.

## To Do

- [ ] Turn into a ruby gem with an executable
- [ ] create a config file `~/.bulletjournal.config` for storing
  - [ ] central notes location
  - [ ] journal-specific notes location
  - [ ] auto-opening your editor of choice
- [ ] accept a more rigid argument input in addition to lazy freetext
- [ ] outstanding items
  - allow parsing through a journals files and spotting/triaging any outstanding items, including moving them forward to specific days
- [ ] creating a default template for a day
- [ ] quick browse (show summary of recent days)
