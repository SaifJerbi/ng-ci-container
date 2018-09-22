# ngcontainer

This docker container provides everything needed to build and test Angular applications:

- node 8.9.2
- npm 5.5.1
- yarn 1.3.2
- Google Chrome 63.0.3239.84
- Mozilla Firefox 47.0.1
- xvfb (virtual framebuffer) for headless testing

This image was built to work into CI environment, like Gitlab ci

you can use it as your ci docker image


## Running tests

Any program that needs to talk to a browser (eg. protractor) should be run under xvfb when executing on a headless machine like on CI. The nice way to factor this is to have your top-level test command which you run locally:

```
$ yarn test
```

Then in your CI configuration, you'd run

```
$ xvfb-run -a yarn test
```
