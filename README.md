# Snackr
[![Build Status][travis-image]][travis-url]

## Table of contents
- [Overview](#overview)
- [Endpoints](#endpoints)
- [Schema](#schema)
- [Technologies](#technologies)
- [Contributors](#contributors)

### Overview

[Snackr](https://snackr-trackr.herokuapp.com) is a food tracking app that rates users' experience after meals. The app is built using a service oriented architecture. For a more detailed explanation of the user experience, please visit our [frontend repo](https://github.com/RowanDW/snackr_frontend).

### Endpoints

UNDER CONSTRUCTION. Note that the following is an expected list.

#### Get meals for a user by date

`GET /users/:id/meals?date=<DATE IN DATETIME>`

Example JSON response:

```
{
  "data": [
    {
      "id": "1",
        "type": "meal",
        "attributes": {
          "name": "Avocado toast",
          "rank": 8,
          "meal_time": "2012-03-05, 00:00:00"
        }
        "relationships": {
          "food_entries": {
            "data": [
              {
                "id": 1,
                "meal_id": 1,
                "food_id": 12345
                "food_name": "bread"
              },
              {
                "id": 2,
                "meal_id": 1,
                "food_id": 68762
                "food_name": "avocado"
              }
            ]
          }
        }
    },

    ....

  ]
}
```

#### Get graphs for user

`GET /users/:id/graphs`

Returns a list of graph uris.

Example JSON response:

```
{
  "data": [
    {
      "type": 'graph',
      "attributes": {
        "name": "10_Highest",
        "uri": "https://image-charts.com/chart?...."
      }
    },
    {
      "type": 'graph',
      "attributes": {
        "name": "10_Lowest",
        "uri": "https://image-charts.com/chart?...."
      }
    }
  ]
}
```

#### Get foods for user

`GET /users/:id/foods`

Returns an ordered, paginated list of foods for a user ranked top to bottom by user rating.

Optional parameters `{ method: method }` under construction.

Example JSON response:

```
{
  "data": [
    {
      "id": "1",
      "type": "food_entry",
      "attributes": {
        "name": "Avocado",
        "average_rank": 8.5
      }
    },
    {
      "id": "8",
      "type": "food_entry",
      "attributes": {
        "name": "Chocolate",
        "average_rank": 8.3
      }
    }
  ]
}

```

#### Post a meal for a user

`POST /users/:id/meals`

Adds a new meal to meals table

Requires the following JSON format:

```
{
  "data": {
    "attributes": {
      "name": "Spaghetti",
      "meal_time": "2012-03-05, 00:00:00",
      "foods": [
        { 
          "food_name": "pasta",
          "food_id": 1234
        },
        {
          "food_name": "sauce",
          "food_id": 5678
        }
      ]
    }
  }
}
```

Example JSON Response:

```
{
  "data": {
    "id": "12",
    "type": "meal",
    "attributes": {
      "name": "Spaghetti",
      "meal_time": "2012-03-05, 00:00:00",
      "rank": -1
    },
    "relationships": {
      "food_entries": {
        "data": {
          "id": 1
          "meal_id": 12
          "food_id": 1234
          "food_name": "pasta"
        },
          "id": 1
          "meal_id": 12
          "food_id": 5678
          "food_name": "sauce"
        }
      }
    }
  }
}
```


#### Update a user's meal rank

`PATCH /users/:id/meals`

Requires the following JSON format:

```
{
  "rank": 7,
  "meal_id": 12
}
```

Response from BE:

```
{
  "data": {
    "id": "12",
    "type": "meal",
    "attributes": {
      "name": "Spaghetti",
      "meal_time": "2012-03-05, 00:00:00",
      "rank": 7
    }
  }
}
```


#### Search for a food

`GET /foods/search?query=<QUERY>`


Example JSON response:

```
{
  "data": [
    { 
      "id": "food_98u23mokdjfkbqkjsdfjk",
      "type": "food",
      "attributes": {
        "name": "Avocado"
      }
    },
    {
      "id": "food_lkjasdf908uw3rkjbasfkh",
      "type": "food",
      "attributes": {
        "name": "Avocado",
      }
    }
  ]
}
```


### Schema
![Database schema](https://user-images.githubusercontent.com/826189/140441780-e5019ab9-3a19-47cc-ad20-f0d7437b27a3.png)

### Technologies

#### Versions
- Ruby 2.7.2
- Rails 5.2.5

#### Development
![Atom][atom-badge]
![Bootstrap][bootstrap-badge]
![Figaro][figaro-badge]
![Git][git-badge]
![GitHub][github-badge]
![Markdown][markdown-badge]  
![PostgreSQL][postgreSQL-badge]   
![Postico][postico-badge]
![Postman][postman-badge]
![Rubocop][rubocop-badge]
![Ruby on Rails][ruby-on-rails-badge]

#### Languages
![ActiveRecord][activerecord-badge]
![CSS3][css3-badge]
![HTML5][html5-badge]
![Ruby][ruby-badge]

#### Deployment
![Heroku][heroku-badge]
![Travis CI][travis-ci-badge]
![Faraday][faraday-badge]

#### Testing
![Capybara][capybara-badge]
![Launchy][launchy-badge]
![Pry][pry-badge]
![RSpec][rspec-badge]
![Shoulda Matchers][shoulda-matchers-badge]
![Simplecov][simplecov-badge]
![VCR][vcr-badge]
![Webmock][webmock-badge]

#### Development Principles
![OOP][oop-badge]
![TDD][tdd-badge]
![MVC][mvc-badge]
![REST][rest-badge]


### Contributors
![LinkedIn][linkedin-badge]

- [Rowan DeLong](https://www.linkedin.com/in/rowandelong/)
- [Michael Mattson](https://www.linkedin.com/in/michael-p-mattson/)
- [Jamie Pace](https://www.linkedin.com/in/jamiejpace/)
- [Samantha Peterson](https://www.linkedin.com/in/samantha-peterson-15b18220b/)
- [Kelsey Thompson](https://www.linkedin.com/in/knthompson2/)

![Github][github-badge]

- [Rowan DeLong](https://github.com/RowanDW)
- [Michael Mattson](https://github.com/michaelpmattson)
- [Jamie Pace](https://github.com/jamiejpace)
- [Samantha Peterson](https://github.com/sami-p)
- [Kelsey Thompson](https://github.com/knthompson2)


<!-- Markdown link & img dfn's -->
[travis-image]:           https://app.travis-ci.com/RowanDW/snackr_backend.svg?branch=main
[travis-url]:             https://app.travis-ci.com/github/RowanDW/snackr_backend

[linkedin-badge]:         https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white
[github-badge]:           https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white

[atom-badge]:             https://img.shields.io/badge/Atom-66595C.svg?&style=flaste&logo=atom&logoColor=white
[bootstrap-badge]:        https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white
[figaro-badge]:           https://img.shields.io/badge/figaro-b81818.svg?&style=flaste&logo=rubygems&logoColor=white
[git-badge]:              https://img.shields.io/badge/Git-F05032.svg?&style=flaste&logo=git&logoColor=white
[github-badge]:           https://img.shields.io/badge/GitHub-181717.svg?&style=flaste&logo=github&logoColor=white
[markdown-badge]:         https://img.shields.io/badge/Markdown-000000?style=for-the-badge&logo=markdown&logoColor=white
[postgreSQL-badge]:       https://img.shields.io/badge/PostgreSQL-4169E1.svg?&style=flaste&logo=postgresql&logoColor=white
[postico-badge]:          https://img.shields.io/badge/postico-b81818.svg?&style=flaste&logo=rubygems&logoColor=white
[postman-badge]:          https://img.shields.io/badge/Postman-FF6C37?style=for-the-badge&logo=Postman&logoColor=white
[rubocop-badge]:          https://img.shields.io/badge/rubocop-b81818.svg?&style=flaste&logo=rubygems&logoColor=white
[ruby-on-rails-badge]:    https://img.shields.io/badge/Ruby%20On%20Rails-b81818.svg?&style=flat&logo=rubyonrails&logoColor=white

<!-- Languages -->
[activerecord-badge]:     https://img.shields.io/badge/ActiveRecord-CC0000.svg?&style=flaste&logo=rubyonrails&logoColor=white
[css3-badge]:             https://img.shields.io/badge/CSS3-1572B6.svg?&style=flaste&logo=css3&logoColor=white
[html5-badge]:            https://img.shields.io/badge/HTML5-0EB201.svg?&style=flaste&logo=html5&logoColor=white
[ruby-badge]:             https://img.shields.io/badge/Ruby-CC0000.svg?&style=flaste&logo=ruby&logoColor=white

<!-- Deployment -->
[heroku-badge]:           https://img.shields.io/badge/Heroku-430098.svg?&style=flaste&logo=heroku&logoColor=white
[travis-ci-badge]:        https://badgen.net/badge/icon/travis?icon=travis&label
[faraday-badge]:          https://img.shields.io/badge/faraday-b81818.svg?&style=flaste&logo=rubygems&logoColor=white


<!-- Testing -->
[capybara-badge]:         https://img.shields.io/badge/capybara-b81818.svg?&style=flaste&logo=rubygems&logoColor=white
[launchy-badge]:          https://img.shields.io/badge/launchy-b81818.svg?&style=flaste&logo=rubygems&logoColor=white
[pry-badge]:              https://img.shields.io/badge/pry-b81818.svg?&style=flaste&logo=rubygems&logoColor=white
[rspec-badge]:            https://img.shields.io/badge/rspec-b81818.svg?&style=flaste&logo=rubygems&logoColor=white
[shoulda-matchers-badge]: https://img.shields.io/badge/shoulda--matchers-b81818.svg?&style=flaste&logo=rubygems&logoColor=white
[simplecov-badge]:        https://img.shields.io/badge/simplecov-b81818.svg?&style=flaste&logo=rubygems&logoColor=white
[vcr-badge]:              https://img.shields.io/badge/vcr-b81818.svg?&style=flaste&logo=rubygems&logoColor=white
[webmock-badge]:          https://img.shields.io/badge/webmock-b81818.svg?&style=flaste&logo=rubygems&logoColor=white

<!-- Development Principles -->
[oop-badge]:              https://img.shields.io/badge/OOP-b81818.svg?&style=flaste&logo=OOP&logoColor=white
[tdd-badge]:              https://img.shields.io/badge/TDD-b87818.svg?&style=flaste&logo=TDD&logoColor=white
[mvc-badge]:              https://img.shields.io/badge/MVC-b8b018.svg?&style=flaste&logo=MVC&logoColor=white
[rest-badge]:             https://img.shields.io/badge/REST-33b818.svg?&style=flaste&logo=REST&logoColor=white
