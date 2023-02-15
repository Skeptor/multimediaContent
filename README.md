# README

### API to manage multimedia content.

### Capabilities:
```
Api::V1::ContentsController
  GET #index
    request list of all movies and seasons

Api::V1::EpisodesController
  GET #index
    request list of all espisodes of a season

Api::V1::MoviesController
  GET #index
    request list of all movies

Api::V1::SeasonsController
  GET #index
    request list of all seasons

Episode
  is not valid without valid attributes
  is valid with valid attributes
  is not valid without a title
  is not valid without a plot
  is not valid without a number
  is not valid without a season

Movie
  is not valid without valid attributes
  is valid with valid attributes
  is not valid without a title
  is not valid without a plot

Season
  is not valid without valid attributes
  is valid with valid attributes
  is not valid without a title
  is not valid without a plot
  is not valid without a number
```