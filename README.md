# NBA Players

> Ruby Capstone Project of Microverse, which students have to complete a real-world-like project within 72 hours according to [this project specifications](https://www.notion.so/microverse/Build-your-own-scraper-f54eaca54d8a4d758a5f0141468127a8)

This web scraper is a scraper that display The Top 100 players for the 2017-18 NBA season.

## Built With

- Ruby
- Nokogiri gem
- Colorize

## Project Structure

```
├── bin
    └── console
    └── nba_players
    └── setup
└── lib
    ├── nba_players
       └── cli.rb
       └── players.rb
       └── scraper.rb
       └── players.rb
       └── version.rb
└── spec
    └── version_spec.rb
    └── spec_helper.rb
├── README.md
```

## Deployment

1. Git clone this repo and cd the to the `capstone_ruby` directory.
2. Run `bundle install` in command line to install Nokogiri and HTTParty Gem.
3. Run `ruby bin/nba_players.rb`.

## Run tests

1. Git clone this repo and cd the to the `capstone_ruby` directory.
2. Install rspec with `gem install rspec`.
3. Run `rspec` in Command Line.
4. `2 examples, 0 failures` will be shown on the screen.

## What it does?

- [x] Have a CLI for interfacing with the application
- [x] Pull data from an external source
- [x] Implement both list and detail views

## Author

👤 **Josue Abraham**

- Github: [@joecleverman](https://github.com/joecleverman)
- Linkedin: [Josue Abraham](https://www.linkedin.com/in/josueabraham/)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/joecleverman/capstone_ruby/issues?q=is%3Aissue+is%3Aopen+sort%3Aupdated-desc).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Microverse
- Nokogiri gem

## 📝 License

This project is [MIT](lic.url) licensed.
