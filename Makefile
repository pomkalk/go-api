
TEST_CMD=$(shell type gotestsum 2>/dev/null >/dev/null && echo "gotestsum --" || echo "go test")

go-lint:
	 golangci-lint run ./...

test:
	$(TEST_CMD) -tags="testing" -v -race -cover -coverprofile=coverage.out ./...

savecover: test
	go tool cover -func coverage.out | grep "total:" > cover.txt