#!/bin/bash

cd /usr/local/proxy && nohup dotnet Pomelo.EntityFrameworkCore.MyCat.Proxy.dll > NULL 2>&1 &

/usr/local/mycat/bin/mycat console