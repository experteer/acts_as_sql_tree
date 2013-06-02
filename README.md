# ActsAsSqlTree [![Build Status](https://secure.travis-ci.org/skamansam/acts_as_sql_tree.png?branch=master)][travis]
[travis]: (http://travis-ci.org/skamansam/acts_as_sql_tree)


ActsAsSqlTree extends ActiveRecord to add simple support for organizing items into
parent–children relationships.

This fork of acts_as_tree uses the WITH RECURSIVE SQL call, thereby speeding up the recursive process.
This is especially beneficial if you have more than one tree model or have a lot of branches
in your tree(s). The drawback is that it can only be used with PostgreSQL 8.4+, Sybase, and
maybe a few others. We are currnelyt only testing for PostgreSQL, so if you find it works
for your database, please let us know and we will disseminate the information.

I used the following information as a guide for these modifications:
http://blog.hashrocket.com/posts/recursive-sql-in-activerecord
Thank you Josh Davey for your awesome tutorial!

## Example

```ruby
class Category < ActiveRecord::Base
  include ActsAsSqlTree

  acts_as_sql_tree order: "name"
end

root      = Category.create("name" => "root")
child1    = root.children.create("name" => "child1")
subchild1 = child1.children.create("name" => "subchild1")

root.parent   # => nil
child1.parent # => root
root.children # => [child1]
root.children.first.children.first # => subchild1
```

## Compatibility

We no longer support Ruby 1.8 or versions of Rails/ActiveRecord older than 3.0. If you're using a version of ActiveRecord older than 3.0 please use 0.1.1.

Moving forward we will do our best to support the latest versions of ActiveRecord and Ruby.

## Change Log for ActsAsSqlTree
* 2.0.0 - June 1st, 2013
  * Skeleton Rewrite of ActsAsTree
  * Major version change due to major code revisions

## Change Log for ActsAsTree
* 1.3.0 - March 29th, 2013
  * Rails 4.0 Support! -- mischa78
  * Readme Fixes -- mischa78 & seanhussey
* 1.2.0 - October 29th, 2012
	* Adding new `self_with_ancestors` accessor -- fbuenemann
	* `roots` is now a scope.
* 1.1.0 - April 24th, 2012
	* Deprecate the ActiveRecord::Acts::Tree module in favor of ActsAsTree
* 1.0.1 - April 18th, 2012
	* Include the Railtie for easier loading in Rails. Will reassess the forced module inclusion in the future.
* 1.0.0 - April 14th, 2012
	* Official 1.0 release. Force users to include the ActiveRecord::Acts::Tree module.
* 0.2.0 - April 9, 2012
	* Rails 3 Support
* 0.1.1 - February 3, 2010
	* Bug Fixes
* 0.1.0 - October 9th, 2009
	* First Gem Release

## Note on Patches/Pull Requests

1. Fork the project.
2. Make your feature addition or bug fix.
3. Add tests for it. This is important so we don't break it in a future version
   unintentionally.
4. Commit, do not mess with rakefile, version, or history. (if you want to have
   your own version, that is fine but bump version in a commit by itself so we can
   ignore when we pull)
5. Send us a pull request. Bonus points for topic branches.

## License (MIT)

Copyright (c) 2007 David Heinemeier Hansson

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the 'Software'), to deal in the
Software without restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the
Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
