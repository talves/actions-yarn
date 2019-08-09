# GitHub Action for Yarn

This Action for [yarn](https://yarnpkg.com/en/) enables arbitrary actions with the `yarn` command-line client, including testing packages and publishing to a registry.

## Usage

An example workflow to build, test, and publish an npm package to the default public registry follows:

`.github/workflows/push.yml`
```yaml
on: push
name: Build, Test, and Publish
jobs:
  yarnInstall:
    name: YarnInstall
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: YarnInstall
      uses: talves/actions-yarn@master
      with:
        args: install
    - name: Test
      uses: talves/actions-yarn@master
      with:
        args: test
    - name: Build
      uses: talves/actions-yarn@master
      with:
        args: build
    - name: SemanticRelease
      uses: talves/actions-yarn@master
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        NPM_TOKEN: ${{ secrets.NPM_TOKEN }}
      with:
        args: semantic-release
```
