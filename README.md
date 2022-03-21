# Mod3 Solo Sweater Weather 

<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#set-up">Set Up</a></li>
    </ul>
    <li>
      <a href="#project-description">About This Project</a>
      <ul>
        <li><a href="#learning-goals-for-project">Learning Goals for Project</a></li>
      </ul>
    </li>
    <li>
      <a href="#apis">Book Club API</a>
      <details>
        <summary>Available Endpoints</summary>
        <ul>
          <li><a href="#forecasts-endpoints">Forecasts Endpoints</a></li>
          <li><a href="#images-endpoints">Images Endpoints</a></li>
          <li><a href="#road-trips-endpoints">Road Trips Endpoints</a></li>
          <li><a href="#users-endpoints">Users Endpoints</a></li>
        </ul>
      </details>
    </li>
  </ol>
</details>

----------

## Getting Started

### Set Up
On your local system, open a terminal session to run the following commands:
1. Clone this repository `$ git clone git@github.com:echon006/sweater_weather.git`
2. Navigate to the newly cloned directory `$ cd sweater_weather`
3. If bundler is not installed run `$ gem install bundler`
4. If or after bundler is installed run `$ bundle install` to install the required Gems
5. If errors occur, check for proper installation and versions of `bundler`, `ruby`, and `rails`
6. Set up the database locally with `$ rails db:{:drop,:create,:migrate,:seed}`
7. Open your text editor and check to see that `schema.rb` exists
8. You may also run the RSpec test suite locally with the command `$ bundle exec rspec` to ensure everything is functioning as expected.

----------

## Project Description

This is a back-end project designed to explore the consumption and combination of data from multiple APIs in order to expose new functionality to a front-end developer.

## Learning Goals for Project:

Explicit

Expose an API that aggregates data from multiple external APIs
Expose an API that requires an authentication token
Expose an API for CRUD functionality
Determine completion criteria based on the needs of other developers
Research, select, and consume an API based on your needs as a developer

Implicit

Project planning
Reading/Writing documentation
Time Management/Prioritizing Work
Break down large project goals into manageable steps
GitHub workflow and project management tools

----------

## APIs
Available endpoints

### Forecasts endpoints

| http verb | name | data type | description |
| --- | --- | --- | --- |
| GET | /forecasts | String | Returns data for the current/daily/hourly weather at a specified location. |

Data sourced from [Open Weather API](https://openweathermap.org/api)

<details>
    <summary> JSON response examples </summary>

Forecast:
```
  {
    "data": {
        "id": null,
        "type": "forecast",
        "attributes": {
            "current_weather": {
                "data": {
                    "datetime": "2022-03-08T12:17:49.000-07:00",
                    "sunrise": "2022-03-08T06:22:28.000-07:00",
                    "sunset": "2022-03-08T17:59:10.000-07:00",
                    "temp": 36.03,
                    "feels_like": 32.74,
                    "humidity": 29,
                    "uvi": 3.95,
                    "visibility": 10000,
                    "conditions": "clear sky",
                    "icon": "01d"
                }
            },
            "hourly_weather": {
                "data": [
                    {
                        "time": "12:00:00",
                        "temp": 36.03,
                        "conditions": "clear sky",
                        "icon": "01d"
                    },
                    {
                        "time": "13:00:00",
                        "temp": 35.6,
                        "conditions": "clear sky",
                        "icon": "01d"
                    },
                    {
                        "time": "14:00:00",
                        "temp": 35.58,
                        "conditions": "clear sky",
                        "icon": "01d"
                    },
                    {
                        "time": "15:00:00",
                        "temp": 35.69,
                        "conditions": "clear sky",
                        "icon": "01d"
                    },
                    {
                        "time": "16:00:00",
                        "temp": 35.55,
                        "conditions": "clear sky",
                        "icon": "01d"
                    },
                    {
                        "time": "17:00:00",
                        "temp": 34.07,
                        "conditions": "clear sky",
                        "icon": "01d"
                    },
                    {
                        "time": "18:00:00",
                        "temp": 31.26,
                        "conditions": "clear sky",
                        "icon": "01n"
                    },
                    {
                        "time": "19:00:00",
                        "temp": 30.36,
                        "conditions": "clear sky",
                        "icon": "01n"
                    }
                ]
            },
            "daily_weather": {
                "data": [
                    {
                        "date": "2022-03-08",
                        "sunrise": "2022-03-08T06:22:28.000-07:00",
                        "sunset": "2022-03-08T17:59:10.000-07:00",
                        "max_temp": 36.03,
                        "min_temp": 20.25,
                        "conditions": "clear sky",
                        "icon": "01d"
                    },
                    {
                        "date": "2022-03-09",
                        "sunrise": "2022-03-09T06:20:54.000-07:00",
                        "sunset": "2022-03-09T18:00:13.000-07:00",
                        "max_temp": 28.31,
                        "min_temp": 16.97,
                        "conditions": "light snow",
                        "icon": "13d"
                    },
                    {
                        "date": "2022-03-10",
                        "sunrise": "2022-03-10T06:19:20.000-07:00",
                        "sunset": "2022-03-10T18:01:16.000-07:00",
                        "max_temp": 24.75,
                        "min_temp": 14.38,
                        "conditions": "snow",
                        "icon": "13d"
                    },
                    {
                        "date": "2022-03-11",
                        "sunrise": "2022-03-11T06:17:45.000-07:00",
                        "sunset": "2022-03-11T18:02:18.000-07:00",
                        "max_temp": 33.84,
                        "min_temp": 14.29,
                        "conditions": "clear sky",
                        "icon": "01d"
                    },
                    {
                        "date": "2022-03-12",
                        "sunrise": "2022-03-12T06:16:09.000-07:00",
                        "sunset": "2022-03-12T18:03:20.000-07:00",
                        "max_temp": 53.56,
                        "min_temp": 27.77,
                        "conditions": "clear sky",
                        "icon": "01d"
                    }
                ]
            }
        }
    }
}

```
</details>

### Images endpoints

| http verb | name | data type | description |
| --- | --- | --- | --- | 
| GET | /images | String | Returns data for a specified number of books related to the keyword search. |

Data sourced from [Unsplash API](https://unsplash.com/documentation)

<details>
  <summary> JSON response examples </summary>

Image:
```
{
    "data": {
        "type": "image",
        "id": null,
        "attributes": {
            "image": {
                "image_id": "zSm5JPgNeuc",
                "description": "woman in white tank top sitting on brown wooden chair",
                "url": "https://images.unsplash.com/photo-1629163330223-c183571735a1?crop=entropy&cs=srgb&fm=jpg&ixid=MnwzMDc5Mjh8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2NDY3NjE1NTA&ixlib=rb-1.2.1&q=85"
            },
            "credit": {
                "original_website": "https://unsplash.com",
                "photographer": "Taylor Daugherty",
                "photographer_profile": "https://unsplash.com/@tayloradaugherty"
            }
        }
    }
}

```

</details>


### Road trips endpoints

| http verb | name | data type | description | 
| --- | --- | --- | --- | 
| GET | /users | String | Returns information about road trip time and weather at destination location at time of arrival |


<details>
  <summary> JSON response examples </summary>

Road Trip:
```
{
    "data": {
        "id": null,
        "type": "roadtrip",
        "attributes": {
            "start_city": "Denver,CO",
            "end_city": "Pueblo,CO",
            "travel_time": "01 hours, 45 minutes",
            "weather_at_eta": {
                "temperature": 38.53,
                "conditions": "clear sky"
            }
        }
    }
}
  
```

</details>


### Users endpoints

| http verb | name | data type | description |
| --- | --- | --- | --- |
| Post | /users | String | Registers a new user | 



<details>
  <summary> JSON response examples </summary>

Register User:
```
{
    "data": {
        "id": 2,
        "type": "users",
        "attributes": {
            "email": "whatever@example.com",
            "api_keys": {{api key generated on user registration}}
        }
    }
}
```
</details>

