# GitHub Action for Yarn

This Action for [yarn](https://yarnpkg.com/en/) enables arbitrary actions with the `yarn` command-line client, including testing packages and publishing to a registry.

## Usage

An example workflow to build, test, and publish an npm package to the default public registry follows:

`.github/workflows/push.yml`
```yaml
on: push
name: Build, Test, and Publish
jobs:
  build:
    name: Build
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - uses: actions/setup-node@master
      with:
        version: 10.x
    - name: Build
      uses: talves/actions-yarn@master
      with:
        args: install
    - name: Test
      uses: talves/actions-yarn@master
      with:
        args: test
    - name: Master
      uses: actions/bin/filter@master
      with:
        args: branch master
    - name: Tag
      uses: actions/bin/filter@master
      with:
        args: tag v*
    - name: Publish
      uses: actions/npm@master
      env:
        NPM_AUTH_TOKEN: ${{ secrets.NPM_AUTH_TOKEN }}
      with:
        args: publish --access public
```
