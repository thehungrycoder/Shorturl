== SETUP

* Clone repo after installing RVM
* Enter to the directory the repo being cloned to
* Run `bundle install`


== Usages
=== Create a short URL

```
curl --data "url=http://yahoo.net" http://localhost:3001
```

=== Expand a shortened URL
```
curl http://localhost:3001/:slug
```
Replace `:slug` with actual shortened slug


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
