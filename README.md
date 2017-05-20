# README

---
### Database design

![](http://i.imgur.com/IG1e807.png)

---
### Seed Data

All data is generated with Faker.

### Relationships

User 1 has roadtrips 1 and 2<br>
User 2 has roadtrips 2, 3 and 5<br>
User 3 has roadtrips 4

Roadtrip 1 has cities 1, 2 and 3<br>
Roadtrip 2 has cities 4 and 5

City 1 has attractions 1, 2 and 3<br>
City 2 has attractions 4 and 5

---
### Routes

Only non-standard routes are listed.

#### Creating a roadtrip
POST /users/1/roadtrips<br>
Will create a new roadtrip. Will add a relationship between the user and the new roadtrip.

#### Deleting a roadtrip
DELETE /users/1/roadtrips/1<br>
will delete roadtrip and remove from join table.

#### Creating a city
POST   /roadtrips/:roadtrip_id/cities
Create city and make relationship to roadtrip.

#### Creating an attraction
POST   /cities/:city_id/attractions<br>
Create attraction and make relationship to city.
