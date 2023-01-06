# Meal Tracker

When did we last eat _this_?

# Deployment

```command
$ (cd deployment && ansible-playbook playbook.yml -i example.com,)
```

Note the trailing comma in the inventory passed with `-i`.

# TODOs

* Engagement is lacking - we need to nag people!
  => Send out reminders at 15:00 if there is no entry for today yet
* Record who created a meal and who tracked a cooking (might even add some gamification later)
* More stats (what's eaten least often, longest time not eaten, etc.)
* Auto-complete for tags
* _Automatically_ test and verify the backup process
* Multiple ordered notes on a meal (i.e. for an individual cooking)
* Roulette - system picks a random meal
* Multi-tenancy
