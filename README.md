# My version of the Inside Out worked example within this great book. 

This worked example starts by BDDing the domain objects, and refining terms and definitions to make the code as close to problem domain as possible (ubiquitous language).

Once this was solid, I then refactored the tests and code to support a simple Sinatra powered web UI to the same domain models. Importantly, the feature files never changes. 

Finally, an sqlite3 database was incorporated, alongside a simple introdution into migrations, ActiveRecord and truncation/transaction style database cleaning inbetween scenarios. 