Build:

```
docker build -t 115pc-docker:1 .
```

Run:
```
docker run --rm -p 5800:5800 -p 5900:5900 115pc-docker:1
```

 Then access `http://<ip>:5800`
