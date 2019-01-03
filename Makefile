
#	protoc -I./foo --python_out=./pypkg ./foo/*.proto
#	protoc -I./foo -I./foo/bar --python_out=./pypkg \

.PHONY: build
build:
	protoc -I./foo --python_out=./pypkg \
	./foo/*.proto \
	./foo/bar/*.proto \
	./foo/bar/qux/*.proto

.PHONY: build2
build2:
	protoc -I./proto --python_out=./pypkg \
	./proto/pypkg/*.proto \
	./proto/pypkg/goods/*.proto

.PHONY: clean
clean:
	rm -f --verbose ./*_pb2*
	rm -f --verbose ./pypkg/*_pb2*
	rm -f --verbose ./pypkg/bar/*_pb2*
	rm -f --verbose ./pypkg/bar/qux/*_pb2*
	rm -f --verbose ./pypkg/pypkg/*_pb2*
#	rm -f --verbose ./pypkg/bar/*_pb2*
#	rm -f --verbose ./pypkg/bar/*_pb2*

