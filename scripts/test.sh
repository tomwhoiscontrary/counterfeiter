#!/usr/bin/env bash

set -e

counterfeiter='/tmp/counterfeiter_test'

ln -fs $(pwd)/fixtures /tmp/symlinked_fixtures

go build -o $counterfeiter

$counterfeiter fixtures Something >/dev/null
$counterfeiter fixtures HasVarArgs >/dev/null
$counterfeiter fixtures HasVarArgsWithLocalTypes >/dev/null
$counterfeiter fixtures HasImports >/dev/null
$counterfeiter fixtures HasOtherTypes >/dev/null
$counterfeiter fixtures ReusesArgTypes >/dev/null
$counterfeiter fixtures EmbedsInterfaces >/dev/null
$counterfeiter fixtures unexportedInterface >/dev/null
$counterfeiter fixtures/aliased_package InAliasedPackage >/dev/null
$counterfeiter /tmp/symlinked_fixtures Something >/dev/null


go build ./fixtures/...

go test -race -v ./...

rm /tmp/symlinked_fixtures
rm -rf fixtures/fixturesfakes
rm -rf fixtures/aliased_package/aliased_packagefakes
rm -rf arguments/argumentsfakes
