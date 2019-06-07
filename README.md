# Habitica-clone-API

The backend for my Vue.js project.  Written in Elixir with phoenix framework.

## Deploying to Production

### Configuration

_add notes here_

### Creating and Publishing a Release

_add steps here_

### Applying Migrations and other Useful Commands

_add notes here_

## Hosting

Public endpoints:

- [https://task-rpg.com/api/player/1](https://task-rpg.com/api/player/1)

The Habitica Clone API is hosted on a [Digital Ocean droplet][do-droplet] with the following specs:

- Image: Ubuntu 18.04 x64
- Size: 2 vCPUs, 4GB / 60GB Disk

I used the following resources to achieve this setup. 

- [Elixir Phoneix 1.4 Deployments w/ Distillery and Edeliver on Ubuntu][how-to-deploy]
    - `erlang` can take a while to install on smaller droplets (15 to 60 minutes)
        - Getting a `jinterface` error? Try `sudo apt-get install openjdk-8-jdk` or `erlang@21.1`
    - `nginx` error and access logs are your friend. You may see `502`s if you haven't applied migrations.
    - I removed `nodejs` and `webpack` steps, as I'm hosting my client w/ `netlify` at a different domain
    - In the `nginx` step, you need to create a `symlink` using something like this:
        - `sudo ln -s /etc/nginx/sites-available/example.com /etc/nginx/sites-enabled/`
- [Setting up SSL w/ Certbot][certbot]
- [Additional Nginx Server Configuration Info][nginx]

<!--
  Links
-->

[do-droplet]: https://www.digitalocean.com/products/droplets/
[how-to-deploy]: https://devato.com/automate-elixir-phoenix-1-4-deployment-with-distillery-and-edeliver-on-ubuntu/
[certbot]: https://certbot.eff.org/lets-encrypt/ubuntubionic-nginx
[nginx]: https://www.digitalocean.com/community/tutorials/how-to-set-up-nginx-server-blocks-virtual-hosts-on-ubuntu-16-04
