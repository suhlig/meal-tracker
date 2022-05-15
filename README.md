# Meal Tracker

When did we last eat _this_?

# Deployment

```command
$ (cd deployment && ansible-playbook playbook.yml -i example.com,)
```

Note the trailing comma in the inventory passed with `-i`.

# TODOs

* Login via allow-listed eMail address only
* Backup sqlite database file to S3 on a regular interval
* Handle rails secrets
# Ideas

* Dashboard shows most often and least often cooked
* Tags for ingredients, categories and other attributes (`sweet`, `meat`, `pasta`)
* Notes on an individual cooking
* Multiple ordered notes on a meal
* Roulette - system picks a random meal
* UUIDs instead of numeric IDs (not sure if it's worth it)
