# Sainsburys Test

Runs a vagrant cluster of:
 * a server running nginx, round robining web requests to:
 * two app servers, running a go binary that responds with `hi there, I'm running on <server>`
 
Pre-requisities:
 * vagrant
 * go compiler

The servers are provisioned using the vagrant chef-solo provisioner.

`make` is used to invoke various tasks:

* `make deploy` to build the go binary, stand up the vagrant servers, and run some tests. 
* `make redeploy` will do the same with vagrant servers already stood up (build go binary, run chef, and run tests).
