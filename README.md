# ngcontainer

This docker container provides everything needed to build and test Angular applications:

- node 10.19.0
- npm 6.13.4
- yarn 1.22.0
- Google Chrome 63.0.3239.84
- Mozilla Firefox 47.0.1
- xvfb (virtual framebuffer) for headless testing

This image was built to work into CI environment, like Gitlab ci

you can use it as your ci docker image

## Docker hub

To pull the image from docker hub you run

```
docker pull sejerbi/ng-ci-container
```

## Running tests

Any program that needs to talk to a browser (eg. protractor) should be run under xvfb when executing on a headless machine like on CI. The nice way to factor this is to have your top-level test command which you run locally:

```
$ yarn test
```

Then in your CI configuration, you'd run

```
$ xvfb-run -a yarn test
```
