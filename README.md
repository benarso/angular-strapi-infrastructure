# angular-strapi-infrastructure

This is a complete virtualized environment using Vagrant and Docker for running a stapi backend with an angular app frontend

```sh
git clone git@github.com:benarso/angular-strapi-infrastructure.git angular-strapi-infrastructure && cd angular-strapi-infrastructure
git submodule init && git submodule update
git submodule foreach npm install
vagrant up
```
