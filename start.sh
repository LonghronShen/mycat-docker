#!/bin/bash

cd /usr/local/proxy && nohup dotnet Pomelo.EntityFrameworkCore.MyCat.Proxy.dll &

/usr/local/mycat/bin/mycat console