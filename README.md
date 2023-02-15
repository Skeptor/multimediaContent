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
  add some examples to (or delete) /root/contentAPI/content-api/spec/app/models/purchase_option_spec.rb (PENDING: Not yet implemented)

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