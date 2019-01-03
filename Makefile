default: build

build:
#	protoc -I./foo --python_out=./pypkg ./foo/*.proto
	protoc -I./foo -I./foo/bar --python_out=./pypkg ./foo/*.proto ./foo/bar/*.proto

clean:
	rm -f --verbose ./*_pb2*
	rm -f --verbose ./pypkg/*_pb2*
	rm -f --verbose ./pypkg/bar/*_pb2*


.PHONY: build clean