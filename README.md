# Snowflake Snowpark (python) - dbt

This project is trying to demonstrate the integration between Snowflake snowpark and dbt without the need of a Third Party Tool.

dbt is orchestrating the transformations including models and also snowpark transformations.

This project is made for UNIX based systems, it is possible to also run it on Windows but the specific requirements are not here listed.


## Requirements

* Snowflake account - [Snowflake signup](https://signup.snowflake.com/) 
* Require grants:
  * CREATE DATABASE
  * CREATE WAREHOUSE
  * CREATE SCHEMA
* Docker - [Docker community edition](https://hub.docker.com/search/?type=edition&offering=community)

## Installation

* 1.-Create resources: database, warehouse, etc.
  * Run the scrip under `sql/env-setup.sql` in your snowflake account.
* 2.-Change the file `.env` you need to provide the following valid parameters after the equals sign:
  * ACCOUNT - (**WITHOUT** https:// and snowflakecomputing.com/... **ONLY** account [locator](https://docs.snowflake.com/en/user-guide/admin-account-identifier.html)) 
  * DATABASE_USERNAME - Username
  * DATABASE_PASSWORD - Password
* 3.-Start Docker
* 4.-Open up a terminal and navigate to the location where you cloned this repository 
  * `cd ~/.../snowflake-dbt`
* 5.-Once you are in the repository run the following command in your terminal: 
  * `make`
  * This will show the possible commands you can run. If you see and error after running it, make sure you added the variables under `.env` go to step 2.
* 6.-Creating containers
  * `make start` 
  * This will create the containers from where you will be running dbt.
* 7.-Running dbt
  * `make run` 
  * This will load the seeds, run dbt models (including snowpark), test the data, etc.
* 8.-After you run it go to `http://localhost:8001/` 

## Usage

TODO: Write usage instructions

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## History

TODO: Write history

## Credits

TODO: Write credits

## License

TODO: Write license
