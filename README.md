# Quickstart

1. Modify `set_pipeline.sh` and set your own Concourse url and team-name.
   (To spawn a local Concourse instance using docker-compose follow the instructions from:
   https://github.com/concourse/concourse-docker/blob/master/README.md)
2. Export the environment variables required by the script:
  ```
  export GIT_PRIVATE_KEY="your git OPENSSH private key here"
  ```
3. Run set_pipeline.sh:
  ```
  ./set_pipeline.yml
  ```


# Disclaimer

The pipelien found in this repo could be run without any secrets at all,
since the repository is public and we are not using any `put` step.

The intention was to provide an example which:
- was minimal, to be easy to understand by anyone
- shows a real use-case, so it can be harnessed by anyone
- solves a hard problem, using extremely simple tools
  (building self-setting pipelines which require secrets
  without a centralized Credential Manager associated to Concourse)
