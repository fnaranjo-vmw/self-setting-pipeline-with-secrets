#!/usr/bin/env bash
set -euo pipefail

# GIT_PRIVATE_KEY="$(fetch secret from whatever service you are storing it)"

fly --target "your-target"                       \
  login                                          \
  --concourse-url "https://your-concourse-url"   \
  --team-name "your-team"

fly --target "your-target"                       \
  set-pipeline                                   \
  --pipeline "your-pipeline"                     \
  --config pipeline.yml                          \
  -l <(cat <<EOF
  secrets:
    git_private_key: "$(echo "${GIT_PRIVATE_KEY}" | sed 's/$/\\n/g' | tr -d '\n')"
EOF
)

# You only need to run this script once,
# when creating your pipeline or after
# rotating any of the secrets used in it

# Otherwise the pipeline is able to be kept
# in sync without any manual intervention

# Notice that secrets set using this strategy
# can be snopped by anyone with permission to run
# `fly get-pipeline`, take this into consideration
# when granting permissions to your instance