URL="https://github.com/duckdb/duckdb/releases/download/v1.1.3/duckdb_cli-linux-amd64.zip"
TEMP_DEB="$(mktemp -d)"
OUTPUT="duckdb_cli-linux-amd64.zip"
cd $TEMP_DEB

curl --fail --location --progress-bar --output $OUTPUT $URL && unzip $OUTPUT
cp duckdb $HOME/.local/bin


rm -rf $TEMP_DEB