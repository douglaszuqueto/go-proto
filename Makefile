GRPC_GW_PATH := $(shell go list -f '{{ .Dir }}' github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway)
APIS_PATH := "$(GRPC_GW_PATH)/../third_party/googleapis"

pb:
	# Server
	protoc -I ${APIS_PATH} -I proto/user proto/user/*.proto --go_out=plugins=grpc:./api/userpb
	protoc -I ${APIS_PATH} -I proto/user proto/user/*.proto --grpc-gateway_out=logtostderr=true:./api/userpb

.PHONY: pb
