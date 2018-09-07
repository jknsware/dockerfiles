#!/bin/bash

rm -f /data/db/mongod.lock
mongod &
pritunl start