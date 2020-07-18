#!/bin/bash

#-v /app/node_modules: Tells docker /app/node_modules should not be overriden by mounted volume (which is deleted on purpose in host)
docker run -t complex_demo_server

