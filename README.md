# _Droid Shop API_

#### _API of Droid shops in different Galaxies: Epicodus solo exercise, 12.15.2017_

#### By _**Elrey Belmonti**_

## Description

_This API is for a directory of location of planets in different Galaxies. In the a particular galaxy on a particular planet you can find shops that will sell you a droid. You can search by locations(by galaxy or planet names) or by shops(name, owner, rating, or droid). You can also get a random shop._

## Setup/Installation Requirements
To install on your own computer....

* Clone this repo
* Run the following commands in the project root directory

```
bundle i
bundle update
rails db:setup
rails db:seed
rails s
```

* API will be available on `http://localhost:3000`(you can change to different server by running rails s -p [server number, ex. 3001])

## Endpoints/API calls

To see endpoint results sign in or create an account with [Postman](https://www.getpostman.com/).
In the URI line put the following URIs:

* To get one page of 10 locations:
  `GET 'http://localhost:3000/api/v1/locations'`
  * to get other pages add `?page={page number}` to the end of the URI
* To get a singular location:
  `GET 'http://localhost:3000/api/v1/locations/{location_id}'`
* To get location by search query:
  `GET 'http://localhost:3000/api/v1/locations/'`
  Params Keys | Values
  ----------- | ------
  planet      | (planet name )
  galaxy      | (galaxy name )

* To get a location's shop:
  `GET 'http://localhost:3000/api/v1/locations/{location_id}/shops'`
* To get a location's shop by a specific key:
  `GET 'http://localhost:3000/api/v1/locations/{location_id}/shops'`
  Params Keys | Values
  ----------- | ------
  name        | (shop name )
  owner      | (owner name )
  rating      | (rating name )
  droid      | (droid name )
  random     | random (will return a random shop)

#### _For any of the following route you need the Authorization key. Follow these step to get key..._
```
Click 'Authorization' and select 'Basic Auth'
Provide user name and password located in 'app/controllers/concerns/application_controller.rb' file
Then you are good to go

```

* To add a location:
  `POST 'http://localhost:3000/api/v1/locations/`
  Params Keys | Values
  ----------- | ------
  planet      | (new planet name )
  galaxy      | (new galaxy name )
* To add a location's shop:
  `POST 'http://localhost:3000/api/v1/locations/{location_id}/shops`
  Params Keys | Values
  ----------- | ------
  name        | (new shop name )
  owner      | (new owner name )
  rating      | (new rating name )
  droid      | (new droid name )
  motto     | (new motto name )
* To update a location:
  `PUT 'http://localhost:3000/api/v1/locations/{location_id}`
  (add the key param of what you wish to change)
  Params Keys | Values
  ----------- | ------
  planet      | (updated planet name )
  galaxy      | (updated galaxy name )

* To update a location's shop:
  `PUT 'http://localhost:3000/api/v1/locations/{location_id}/shops`
  (add the key param of what you wish to change)
  Params Keys | Values
  ----------- | ------
  name        | (updated shop name )
  owner      | (updated owner name )
  rating      | (updated rating name )
  droid      | (updated droid name )
  motto     | (updated motto name )
* To delete a location:
  `DELETE 'http://localhost:3000/api/v1/locations/{location_id}`
* To delete a location's shop:
  `DELETE 'http://localhost:3000/api/v1/locations/{location_id}/shops/{shop_id}`

## Known Bugs 🐛🐛🐛

* _Authentication is not super secure_

## Support and contact details

_Feel free to contact me at elbelmonti@gmail.com_

## Technologies Used

* _Ruby_
* _Rspec_
* _Rails API_

## Contributors

<!-- Contributors START
Elrey_Belmonti ElreyB https://github.com/ElreyB code doc bug design tests
Contributors END -->
<!-- Contributors table START -->
| <img src="https://avatars.githubusercontent.com/ElreyB?s=100" width="100" alt="Elrey Belmonti" /><br />[<sub>Elrey Belmonti</sub>](https://github.com/ElreyB)<br />[💻](https://github.com/ElreyB/word-definer/commits?author=ElreyB) [📖](https://github.com/ElreyB/word-definer/commits?author=ElreyB) [🐛](https://github.com/ElreyB/word-definer/issues?q=author%3AElreyB) 🎨 [⚠️](https://github.com/ElreyB/word-definer/commits?author=ElreyB) |
| :---: |
<!-- Contributors table END -->
This project follows the [all-contributors](https://github.com/kentcdodds/all-contributors) specification.
