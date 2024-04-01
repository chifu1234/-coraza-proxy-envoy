
build:
	docker build -f Dockerfile . -t coraza-proxy-envoy

run: build
	docker run -it -p 8080:8080 coraza-proxy-envoy 
