# README

## API to manage multimedia content.

## Endpoint examples
1. Return all the movies: <br />
http://localhost:3000/api/v1/movies

2. Return all the seasons with a list of the season's episodes: <br />
http://localhost:3000/api/v1/seasons

3. Return the movies and the seasons: <br />
http://localhost:3000/api/v1/contents

4. Purchase a movie: <br />
http://localhost:3000/api/v1/purchase/?user_id=1&content_id=1&content_type=Movie&purchase_option_id=1

5. Get the library of an user: <br />
http://localhost:3000/api/v1/users/1/library

### Capabilities:
```
Api::V1::ContentsController
  GET #index
    return a successful response
    request list of all movies and seasons

Api::V1::EpisodesController
  POST #create
    creates a episode successfully
  GET #index
    return a successful response
    request list of all espisodes of a season
  GET #show
    returns the Episode object by id
  PUT #update
    updates the Season information
  DELETE #destroy
    deletes the Episode

Api::V1::MoviesController
  POST #create
    creates a movie successfully
  GET #index
    return a successful response
    request list of all movies
  GET #show
    returns the Movie object by id
  PUT #update
    updates the Movie information
  DELETE #destroy
    deletes the movie

Api::V1::PurchasesController
  POST #purchase
    purchase a movie succesfully
    purchase a season succesfully
    fails when the user try to purchase a movie that is already in his library
    allows the user to purchase an expired movie
    raise an error when there are missing parameters in the purchase

Api::V1::SeasonsController
  POST #create
    creates a season successfully
  GET #index
    return a successful response
    request list of all seasons
  GET #show
    returns the Season object by id
  PUT #update
    updates the Season information
  DELETE #destroy
    deletes the Season
    deletes all the episodes of a Season

Api::V1::PurchasesController
  GET #library
    returns the user's library filtering expired movies

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
  validations
    is expected to validate that :price cannot be empty/falsy
    is expected to validate that :video_quality cannot be empty/falsy
  enums
    is expected to define :video_quality as an enum backed by an integer with values ‹{HD: 0, SD: 1}›

Purchase
  is not valid without valid attributes
  add a purchase with valid attribues

Season
  is not valid without valid attributes
  is valid with valid attributes
  is not valid without a title
  is not valid without a plot
  is not valid without a number

User
  is not valid without valid attributes
  is valid with valid attributes
```

### Code Coverage
All Files ( 92.01% covered at 1.6 hits/line ) <br />
39 files in total. <br />
438 relevant lines, 403 lines covered and 35 lines missed. ( 92.01% )
