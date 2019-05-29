#!/bin/bash

ps -ef | grep redis | awk '{print $2}' > /opt/out.txt;

sudo kill -9 $(head -n 1 /opt/out.txt);
