# testGuru
[testGuru](https://github.com/zipnikitin/testGuru)


### Clone the repository

```shell
git clone git@github.com:zipnikitin/testGuru
cd project
```

### Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby 3.0.0`

If not, install the right ruby version using [rbenv](https://github.com/rbenv/rbenv) (it could take a while):

```shell
rbenv install 3.0.0
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler) and [Yarn](https://github.com/yarnpkg/yarn):

```shell
gem install bundler:1.17.3
bundle install
```

### Initialize the database

```shell
rails db:create db:migrate db:seed
```

### Launch the local server

```shell
bin/rails server
```

## Root link

[LocalServer](http://localhost:3000)

## Test link

[Test](http://localhost:3000/test)

## Categories links

[Easy](http://localhost:3000/test/easy)
[Middle](http://localhost:3000/test/mid)
[Hard](http://localhost:3000/test/hard)

## Easy quastions

[1](http://localhost:3000/test/easy/1)
[2](http://localhost:3000/test/easy/2)
[3](http://localhost:3000/test/easy/3)

## Middle quastions

[1](http://localhost:3000/test/mid/1)
[2](http://localhost:3000/test/mid/2)
[3](http://localhost:3000/test/mid/3)

## Hard quastions

[1](http://localhost:3000/test/hard/1)
[2](http://localhost:3000/test/hard/2)
[3](http://localhost:3000/test/hard/3)

## Answers

[Answers](http://localhost:3000/test/answers)

## User Results

[Results](http://localhost:3000/test/results)