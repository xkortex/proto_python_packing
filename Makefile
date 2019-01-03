
#	protoc -I./foo --python_out=./pypkg ./foo/*.proto
#	protoc -I./foo -I./foo/bar --python_out=./pypkg \

mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(notdir $(patsubst %/,%,$(dir $(mkfile_path))))

$(info "mkfile path: [$(mkfile_path)]")
$(info "current dir: [$(current_dir)]")

.PHONY: build
build:
	protoc -I./foo --python_out=./pypkg \
	./foo/*.proto \
	./foo/bar/*.proto \
	./foo/bar/qux/*.proto

# https://groups.google.com/forum/#!topic/protobuf/ZDTuqPjEFD8
# If you don't want to put your .proto files into a tree matching your Python
# package tree, you could alternatively map them into such a tree virtually like so:
#
# protoc --proto_path=mypkg=proto
#
# This maps the virtual directory "mypkg" to the physical directory "proto".
# You would then have to write your imports like:
#
#  import "mypkg/a.proto"
#
# You can also map individual files.

.PHONY: build2
build2:
	protoc -I=pypkg=proto --python_out=./pypkg \
	./proto/subpkg/*.proto \
	./proto/subpkg/goods/*.proto

.PHONY: clean
clean:
	rm -f --verbose ./*_pb2*
	rm -f --verbose ./pypkg/*_pb2*
	rm -f --verbose ./pypkg/bar/*_pb2*
	rm -f --verbose ./pypkg/bar/qux/*_pb2*
	rm -f --verbose ./pypkg/pypkg/*_pb2*
#	rm -f --verbose ./pypkg/bar/*_pb2*
#	rm -f --verbose ./pypkg/bar/*_pb2*

