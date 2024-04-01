
build:
	docker build -f Dockerfile . -t coraza-proxy-envoy

run: build
	docker run -it -p 8080:8080 -v ${PWD}/envoy.yaml:/etc/envoy/envoy.yaml coraza-proxy-envoy 
