#!/usr/bin/env bash

set -e
echo $PWD

TASK="$1"
ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"

cd "$ROOT_DIR"

case "$TASK" in
  generate-integration-diagram)
    PROMPT="../prompts/generate-integration-diagram.md"
    ;;

  draft-portfolio-report)
    PROMPT="../prompts/draft-portfolio-report.md"
    ;;

  architecture-review)
    PROMPT="../prompts/architecture-review.md"
    ;;

  *)
    echo "Unknown task: $TASK"
    echo "Allowed tasks:"
    echo "  generate-integration-diagram"
    echo "  draft-portfolio-report"
    echo "  architecture-review"
    exit 1
    ;;
esac

echo "Running EA task: $TASK"
echo "Using prompt: $PROMPT"

openclaw agent --agent main --message "$(cat "$PROMPT")" --thinking high
