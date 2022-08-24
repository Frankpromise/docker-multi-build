# MULTI-STAGE BUILD IN DOCKER

The purpose of doing a multi stage build is to optimize our images as much as possible. And usually, we want to make it snaller.

## why are small images better

- less components mean lower chance of security breaches.

- Smaller size means fast distribution

but it can also be a challenge.

### basic techniques for multi stage build

- use base image

- Seperate the build image from the execuion image.

## what is then multi stage build

- one dockerfile with  multiple base images allowing us to copy data between them.
It helps simplify the mechanics of the builder pattern.


## example

```
FROM build_image:v1 AS builder
COPY sources .
RUN install build dependences
RUN build tool

FROM minimal_run_time_image:v2
COPY --from=builder /output /app
COPY entry-point.sh /app
ENTRYPOINT ["/app/entry-point.sh"]
```
## with multiple stage:

- we can use multiple FROM statements in one dockerfile

- Each FROM instruction can use a differen base.

- Each of them begins with a new stage of build.

- You can selectively copy artifacts fromone stage to another, leaving behind everything you dont wan in the final image.

- Name your build stages because by default, stages are not named, You can also choose to refer to them by their integer number, starting from 0 for the first FROM instructon.

- You can name your stages by adding an "as <Name>" to the FROM instruction.

- if we would like to stop a a specific build stage, specify a target build stage

- docker build --target builder -t <image>. It is usually useful for debugging.


## TASK

Hello Java Instructions
-----------------------
In this exercise you will practice some Java usage basics and create a multi-stage build.

hello-java is a simple program that writes to the console.
In order to build it you will need the maven build tool and the Java Development Kit version 8 (JDK8). The official maven docker image has both.

https://vitux.com/how-to-install-java-on-ubuntu-20-04/

In order to execute it you will only need a Java Runtime Environment (JRE). Note that this specific program insists on running in a clean JRE 8, and will complain if run in JDK.

Some of the commands you will use:
[a] To build: `mvn verify`

    The resulting application is found in "target" as "hello-java.jar".
    
[b] To run: `java -jar hello-java.jar`

Tasks:
Part I - Manual stuff
(1) Pull a maven docker image and manually build the application
(2) Manually run the application
(3) If you did not get full points - fix what you did wrong, until you do.

Part II - Dockerfile
(4) Build the application using maven image and a volume
(5) Create a Dockerfile that include the application and runs it as the entrypoint

Part III - Multi-stage
(6) Create a multi-stage Dockerfile that
(a) builds the application based on COPY of sources
(b) creates an image which includes the app as it's entry point


