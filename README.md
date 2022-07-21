# Snowflake Snowpark (python) - dbt

This project is trying to demonstrate the integration between Snowflake Snowpark and dbt,
the transformations here presented are quite simple set a foundational 
. This project is running dbt and Snowpark directly without the need of an external library or wrapper.

## Requirements

* Snowflake - [Snowflake signup](https://signup.snowflake.com/) account (require grants):
  * CREATE DATABASE
  * CREATE WAREHOUSE
  * CREATE SCHEMA
* Docker - [Docker community edition](https://hub.docker.com/search/?type=edition&offering=community)

## Installation

* Create resources: database, warehouse, etc.
  * Run the scrip under `sql/env-setup.sql` in your snowflake account.
* Change the file `.env` you need to provide the following valid parameters and replace: {ADD}:
  * ACCOUNT (**WITHOUT** https and snowflakecomputing.com/... **ONLY** account locator) 
  * DATABASE_USERNAME
  * DATABASE_PASSWORD
  * Note: To get your account identifier please check out this [link](https://docs.snowflake.com/en/user-guide/admin-account-identifier.html).
* Start Docker
* Open up a terminal and navigate to the location where you cloned this repository (`cd ~/.../snowflake-dbt`)
* Once you are in the repository run the following command: `make start`
  * This will create two Docker containers: 
    * One for the dbt Webserver (Lineage visualization in dbt) 
    * One for dbt execution.

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
