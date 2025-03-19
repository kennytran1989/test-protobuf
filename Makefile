.PHONY: init
init:
	go get google.golang.org/protobuf/cmd/protoc-gen-go@v1.28.1
	go get google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.2.0
	go get github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-grpc-gateway@latest
	go get github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-openapiv2@latest


.PHONY: gen proto
gen-proto:
	protoc --proto_path=./ \
		   --proto_path=./third_party \
      --go_out=paths=source_relative:. \
      --go-grpc_out=paths=source_relative:. \
      --grpc-gateway_out=paths=source_relative:. \
	  --openapiv2_out=. --openapiv2_opt=logtostderr=true\
      user/v1/user.proto \
      common/error.proto
