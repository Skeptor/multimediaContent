# README

### API to manage multimedia content.

### Capabilities:
```
Api::V1::ContentsController
  GET #index
    return a successful response
    request list of all movies and seasons

Api::V1::EpisodesController
  GET #index
    return a successful response
    request list of all espisodes of a season

Api::V1::MoviesController
  GET #index
    return a successful response
    request list of all movies

Api::V1::SeasonsController
  GET #index
    return a successful response
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

PurchaseOption
  is expected to have db column named payment_id of type integer
  is expected to have db column named payment_type of type string
  is expected to belong to payment required: true
Season
  is not valid without valid attributes
  is valid with valid attributes
  is not valid without a title
  is not valid without a plot
  is not valid without a number
```

### Code Coverage
All Files ( 83.54% covered at 1.21 hits/line )
28 files in total.
243 relevant lines, 203 lines covered and 40 lines missed. ( 83.54% )