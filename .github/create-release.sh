set -euo pipefail
IFS=$'\t\n'

. ./.github/gh-config.sh

gh release create --verify-tag --title $GITHUB_REF_NAME $GITHUB_REF_NAME
echo test > test.txt
gh release upload $GITHUB_REF_NAME test.txt
