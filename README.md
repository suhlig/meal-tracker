# Meal Tracker

When did we last eat _this_?

# Deployment

```command
$ (cd deployment && ansible-playbook playbook.yml -i example.com,)
```

Note the trailing comma in the inventory passed with `-i`.

# TODOs

* More stats (what's eaten least often, longest time not eaten, etc.)
* autocomplete for tags
* _Automatically_ test and verify the backup process
* Multiple ordered notes on a meal (i.e. for an individual cooking)
* Roulette - system picks a random meal

# Backup

* A systemd timer creates a daily backup of the database (based on this [article](https://litestream.io/alternatives/cron/))
* An S3 bucket is set up to keep the backup files. It is set without versioning, so that we keep only the last generation for a day of the week or week of the year. Yearly backups will be kept "forever".
* There are seven daily backup files uploaed to an S3 bucket:
  - mealtracker-production.Monday.sqlite3
  - mealtracker-production.Tuesday.sqlite3
  - ...
  - mealtracker-production.Sunday.sqlite3
* Likewise, there is a backup file for each week of the year, copied on Sunday:
  - mealtracker-production.week-01.sqlite3
  - ...
  - mealtracker-production.week-53.sqlite3

  Same for each year; the file of Dec 31st of each year is kept as:
  - mealtracker-production.2022.sqlite3
  - mealtracker-production.2023.sqlite3
  - ...
