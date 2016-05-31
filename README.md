PokitDok API Documentation
==========================

*This documentation was created with Slate. Check it out at [tripit.github.io/slate](http://tripit.github.io/slate).*

This repository contains developer docs for the [PokitDok APIs](https://platform.pokitdok.com)

### Found a bug? Want to help update these docs? Excellent!

### Steps: ###

 1. Fork this repository on Github.
 2. Clone *your forked repository* (not our original one) to your machine with `git clone https://github.com/YOURUSERNAME/apidocs-v4.git`
 3. `cd apidocs-v4`
 4. Use setup script to create docker-machine: `sh setup.sh`
 5. Look at your docker-machine IP: `docker-machine ip apidocs`
 6. Start local server: `docker run -it -p 8080:4567 -v $PWD:/app ruby:2.3 /app/serve.sh`

Using the IP address of your local apidocs docker-machine and port 8080,
you can now see the docs at `http://(docker-machine ip apidocs):8080`. 

Whoa! That was fast!

[Handy reference guide for editing slate markdown.](https://github.com/tripit/slate/wiki/Markdown-Syntax)

When you're done editing, send us a pull request.
