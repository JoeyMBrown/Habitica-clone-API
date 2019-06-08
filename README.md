# Habitica-clone-API

The backend for my Vue.js project.  Written in Elixir with phoenix framework.

## Deploying to Production

### Configuration

Version - Before creating a new release, make sure to update the version number
in mix.exs

### Creating and Publishing a Release

There are a few steps to creating and publishing a release, follow:

  - Generate a new release, `$mix edeliver build release production`
    - This builds new release and stores it in .edeliver/releases
    - Make sure to change version number in mix.exs

  - Next, to push the new release, `$mix edeliver deploy release to production`
  
    - This uploads the release and extracts it, also starts the production server.

  - Check that the server is running the correct version, `$mix edeliver version production`
  
    - This is why updating the version number is crucial, without it testing version will 
    be a tad more difficult.
  
  - Restart the production server, `$mix edeliver restart production`

  - Run migrations!  `$mix edeliver migrate production`

### Applying Migrations and other Useful Commands

If new migrations are added in a release, remember to do: `$mix edeliver migrate production`

## Hosting

Public endpoints:

- [https://task-rpg.com/api/player/1](https://task-rpg.com/api/player/1)

The Habitica Clone API is hosted on a [Digital Ocean droplet][do-droplet] with the following specs:

- Image: Ubuntu 18.04 x64
- Size: 2 vCPUs, 4GB / 60GB Disk

While serving our Phoenix application from behind an `Nginx` reverse proxy.

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
