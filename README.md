# Date-Test

A User Class that takes a name and a date of birth; and can calculate the age of the user and the date of their next birthday.

## Usage

To run the tests:
```
$ bundle install
$ bundle exec rspec
```

To run the linter:
```
bundle install
bundle exec rubocop
```

To run the file and see the output:

```
$ ruby lib/user.rb
```

Output as of Sunday 8th November 2020:
```
====== ages ======
1986-01-01 => 34
1988-11-08 => 32
1990-12-30 => 29
====== birthdays ======
1986-01-01 => 2021-01-01
1988-11-08 => 2021-11-08
1990-12-30 => 2020-12-30
```
