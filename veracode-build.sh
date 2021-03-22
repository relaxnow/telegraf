#!/bin/bash
set -e
echo "Quick and dirty example script for producing a build for Veracode Static Analysis, selecting only Unix build"
echo "FAILED: Please review and adapt this script before use and remove exit 1 and this message."
exit 1
# Veracode Static Analysis requires all third party libraries in veracode folder
go mod vendor
# Veracode Static Analysis does not currently work with build tags, 
# any platform specific code must be removed.
rm cmd/telegraf/telegraf_windows.go
# Produce a zip to be uploaded to Veracode
cd ..
zip -rq telegraf-for-veracode.zip telegraf
# Restore deleted file from git
cd telegraf
git checkout cmd/telegraf/telegraf_windows.go
echo "Done, please upload ../telegraf-for-veracode.zip to Veracode"
