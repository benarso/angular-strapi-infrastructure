# angular-strapi-infrastructure

This is a complete cross-platform development environment for running Docker containers inside a Vagrant box.

This project is running a Strapi.io backend with MongoDb and my angular-cleaner-architecture frontend projet.

The Strapi.io and Angular projects have their own repositories, and are linked to this projet using git submodule feature.

Download and install Vagrant at https://www.vagrantup.com/downloads.html

```sh
git clone git@github.com:benarso/angular-strapi-infrastructure.git angular-strapi-infrastructure && cd angular-strapi-infrastructure
git submodule init && git submodule update
git submodule foreach npm install
vagrant up
```

Building the vm and containers for the first time can take a while. Go make some coffee...

Once everything is started, open your browser at http://localhost:1337/admin to access the Strapi.io admin panel

Angular app instructions are Coming Soon
