FROM tinygo/tinygo as build
USER root
WORKDIR /tmp
ADD https://github.com/corazawaf/coraza-proxy-wasm/archive/refs/tags/0.5.0.tar.gz /tmp/wasm.tar.gz
RUN tar -xzf /tmp/wasm.tar.gz && \
    mv coraza-proxy-wasm-* coraza-proxy-wasm
WORKDIR /tmp/coraza-proxy-wasm
RUN go run mage.go build


FROM  envoyproxy/envoy:v1.29-latest
COPY --from=build /tmp/coraza-proxy-wasm/build/main.wasm /coraza-proxy.wasm
