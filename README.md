# flnpw/envconsul

This repo has envconsul installed for using on multilayer builds, as a installer or
as is.

## How to use

Using this image in a multilayered Dockerfile and fetching envconsul from it:
```
FROM flnpw/envconsul AS envconsul
...
FROM myimage
...
COPY --from=envconsul /usr/local/bin/envconsul /<wherever>/envconsul
...
```

Using this image as a local installer:
```
docker run --rm -ti \
  --entrypoint='' \
  -v /usr/local/bin:/target \
  flnpw/envconsul \
  cp /usr/local/bin/envconsul /target
```
