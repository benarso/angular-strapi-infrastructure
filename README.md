# angular-strapi-infrastructure

This is a complete virtualized environment using Vagrant and Docker for running a Strapi.io backend with MongoDb and an angular app frontend

```sh
git clone git@github.com:benarso/angular-strapi-infrastructure.git angular-strapi-infrastructure && cd angular-strapi-infrastructure
git submodule init && git submodule update
git submodule foreach npm install
vagrant up
```
Be patient !

Next, open your browser at http://localhost:1337/admin to access the Strapi.io admin panel
Angular app instructions are Coming Soon
