FROM alpine:latest as Pre-build
WORKDIR /code
COPY ./helloworld.txt ./helloworld.txt
RUN echo "Prebuild actions.."

FROM alpine:latest as Build
RUN echo "this is Build step"

FROM alpine:latest as Test
WORKDIR /unittest
COPY --from=Pre-build /code/helloworld.txt ./helloworld.txt
RUN echo "Running unit tests" >> ./helloworld.txt

FROM alpine:latest as Security
RUN echo "This is security"

FROM alpine:latest as Back-end
WORKDIR /Backend
COPY --from=Test /unittest/helloworld.txt ./helloworld.txt
RUN echo "mvn --version"

FROM alpine:latest as Front-end
RUN echo "node --version"

FROM alpine:latest as Deploy 
WORKDIR /Deployment
COPY --from=Pre-build /code/helloworld.txt ./helloworld.txt
RUN echo "s3 cp src dst"

FROM alpine:latest as Post
RUN  echo "Clear env"
