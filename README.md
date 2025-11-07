# Heroku Deploy

[![Step changelog](https://shields.io/github/v/release/bitrise-steplib/steps-heroku-deploy?include_prereleases&label=changelog&color=blueviolet)](https://github.com/bitrise-steplib/steps-heroku-deploy/releases)

Deploy to Heroku

<details>
<summary>Description</summary>

Deploy to [Heroku](https://heroku.com).

This step installs the [Heroku Toolbelt](https://toolbelt.heroku.com)
if it's not yet installed, and it also **logs in** with the Toolbelt
if you're not logged in already.
</details>

## 🧩 Get started

Add this step directly to your workflow in the [Bitrise Workflow Editor](https://docs.bitrise.io/en/bitrise-ci/workflows-and-pipelines/steps/adding-steps-to-a-workflow.html).

You can also run this step directly with [Bitrise CLI](https://github.com/bitrise-io/bitrise).

## ⚙️ Configuration

<details>
<summary>Inputs</summary>

| Key | Description | Flags | Default |
| --- | --- | --- | --- |
| `heroku_api_token` | You can get your API Token by running `heroku auth:token` in your Terminal/Command Line, if you have the [Heroku Toolbelt](https://toolbelt.heroku.com) installed, or you can follow the [official guide on Heroku](https://devcenter.heroku.com/articles/platform-api-quickstart).  | required, sensitive | `$HEROKU_API_TOKEN` |
| `heroku_app_id` | Your webapp's Heroku App ID. This is the ID of the App you can see on your [Heroku Dashboard](https://dashboard.heroku.com/apps).  | required, sensitive | `$HEROKU_APP_ID` |
| `force_push` | If this option is allowed the project will be force-pushed to the Heroku repository. This might be necessary if the repository already exists there. | required | `false` |
</details>

<details>
<summary>Outputs</summary>
There are no outputs defined in this step
</details>

## 🙋 Contributing

We welcome [pull requests](https://github.com/bitrise-steplib/steps-heroku-deploy/pulls) and [issues](https://github.com/bitrise-steplib/steps-heroku-deploy/issues) against this repository.

For pull requests, work on your changes in a forked repository and use the Bitrise CLI to [run step tests locally](https://docs.bitrise.io/en/bitrise-ci/bitrise-cli/running-your-first-local-build-with-the-cli.html).

Learn more about developing steps:

- [Create your own step](https://docs.bitrise.io/en/bitrise-ci/workflows-and-pipelines/developing-your-own-bitrise-step/developing-a-new-step.html)
