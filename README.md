# starrocks-tool-box

When you are working in cloud native container environments, you might need tools to help you execute queries, administrator and debug StarRocks.  You can use this container image to help you with those task.

```
docker build -t atwong/starrocks-tool-box:0.1 -t atwong/starrocks-tool-box:latest .
docker push atwong/starrocks-tool-box:0.1
docker push atwong/starrocks-tool-box:latest
```

Published to https://hub.docker.com/r/atwong/starrocks-tool-box

How to use in docker compose
```
  starrocks-toolkit:
    image: atwong/starrocks-tool-box
    hostname: starrocks-toolkit
    container_name: starrocks-toolkit
    volumes:
      - ./srtooldata:/home/data
    depends_on:
      starrocks:
        condition: service_healthy
    entrypoint: >
      /bin/sh -c "
      mysql -P 9030 -h starrocks-fe -u root -e \"create database demo\";
      exit 0;
      "
```

<img referrerpolicy="no-referrer-when-downgrade" src="https://static.scarf.sh/a.png?x-pxid=96b63550-7072-4fba-aef6-b4d962decebd" />
