Created local IMDB database using https://github.com/ameerkat/imdb-to-sql
Current IMDB dumps are available at ftp://ftp.fu-berlin.de/pub/misc/movies/database/

Neoid gem: https://github.com/neoid-gem/neoid

To add Neo4j to project:
    gem install neo4j-core --pre
    rake neo4j:install[community,1.9.8]
    rake neo4j:start

To import data from sql to neo4j:
    rails runner scripts/fromSqlMigration.rb
