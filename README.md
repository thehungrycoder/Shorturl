# Setup

* Clone repo after installing RVM
* Enter to the directory the repo being cloned to
* Run `bundle install`


# Usages
#### Create a short URL

```
curl --data "url=http://yahoo.net" http://localhost:3000
```

If you want to use your own shortname

```
curl --data "url=http://yahoo.net&slug=3dkdkd" http://localhost:3000
```


*Note*: Replace port from `3000` to your local running port.

#### Expand a shortened URL
```
curl http://localhost:3000/:slug
```

*Note*: Replace port from `3000` to your local running port. Replace `:slug` with actual shortened slug.


# Run Tests
```
bundle exec rspec
```