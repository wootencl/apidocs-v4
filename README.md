PokitDok API Documentation
==========================

*This documentation was created with Slate. Check it out at [tripit.github.io/slate](http://tripit.github.io/slate).*

This repository contains developer docs for the [PokitDok APIs](https://platform.pokitdok.com)

### Found a bug? Want to help update these docs? Excellent!

### Steps: ###

 1. Fork this repository on Github.
 2. Clone *your forked repository* (not our original one) to your machine with `git clone https://github.com/YOURUSERNAME/apidocs-v4.git`
 3. `cd apidocs-v4`
 4. Install all dependencies: `bundle install`
 5. Start the test server: `./start_server.sh`

You can now see the docs at <http://localhost:4567>. Whoa! That was fast!

### Deployment
The Platform API documentation is deployed to and served from a S3 bucket. [An S3 client](http://docs.aws.amazon.com/cli/latest/userguide/installing.html) is required to upload files to S3.

1. Create a pull request from dev -> master.
2. Draft a new release using our standard naming convention.
3. Fetch the release tag into your local environment.
4. In your local environment execute the following command to build the static site:
```
 bundle exec middleman build
```
5. Copy the contents of the *build* directory to the *pokitdok-apidocs* S3 bucket using the S3 tool of your choice.
  * cd to the *build* directory.
  * Running the following command copies the contents of the current directory to the *pokitdok-apidocs* S3 bucket:
  ```
  aws s3 cp . s3://pokitdok-apidocs/ --recursive
  ```
6. Verify that the permissions for *pokitdok-apidocs* are set to *read-only* for all users.

[Handy reference guide for editing slate markdown.](https://github.com/tripit/slate/wiki/Markdown-Syntax)

When you're done editing, send us a pull request.
