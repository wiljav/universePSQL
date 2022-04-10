# Universe Database in PostgreSQL
### freecodecamp project
***
### Database Structure
```
.
└── Universe
    ├── galaxy
    │   ├── galaxy_id (type = SEQUENCE)   ->  primary key
    │   ├── name (type = VARCHAR(40))
    │   ├── mass_in_bill_earth_mass
    │   ├── satellite_galaxy (type = BOOL)
    │   └── humans_galaxy (type = BOOL)
    ├── star
    │   ├── galaxy_id (type = INT)        ->  foreign key
    │   ├── star_id (type = SEQUENCE)     ->  primary key
    │   ├── name (type = VARCHAR(40))
    │   ├── planets (type = INT)
    │   ├── moons (type = INT)
    │   ├── humans_star (type = BOOL)
    │   ├── binary_star (type = BOOL)
    │   └── age_in_bill_years (type = numeric(4,1))
    ├── planet
    │   ├── galaxy_id (type = INT)        ->  foreign key
    │   ├── star_id (type = INT)          ->  foreign key
    │   ├── planet_id (type = SEQUENCE)   ->  primary key
    │   ├── name (type = VARCHAR(40))
    │   ├── humans_planet (type = BOOL)
    │   ├── moons (type = INT)
    │   ├── habitable (type = BOOL)
    │   └── mass_in_earth_mass (type = numeric(4,1))
    └── moon
        ├── galaxy_id (type = INT)        ->  foreign key
        ├── star_id (type = INT)          ->  foreign key
        ├── planet_id (type = INT)        ->  primary key
        ├── moon_id (type = SEQUENCE)     ->  primary key
        ├── name (type = VARCHAR(40))
        ├── habitable (type = BOOL)
        ├── mass_in_earth_mass (type = numeric(4,1))
        ├── milky_way_moon (type = BOOL)
        └── shape  (type = TEXT)
```
