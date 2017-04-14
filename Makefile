git_version = $$(git branch 2>/dev/null | sed -e '/^[^*]/d'-e's/* \(.*\)/\1/')
npm_bin= $$(npm bin)

all: test
install:
	@npm install
test:
	@node --harmony \
		${npm_bin}/istanbul cover ${npm_bin}/_mocha \
		-- \
		--timeout 10000 \
		--require co-mocha
travis: install
	@NODE_ENV=test $(BIN) $(FLAGS) \
		./node_modules/.bin/istanbul cover \
		./node_modules/.bin/_mocha \
		--report lcovonly \
		-- -u exports \
		$(REQUIRED) \
		$(TESTS) \
		--bail
jshint:
	@${npm_bin}/jshint .
server:
	@node run.js
build-docker:
	docker build . -t="node-task-sample"
deploy: install
	make server
deploy-ci: install
	make server &
ci: build-docker
	docker run -it -p 9001:9001 --entrypoint=bash --rm node-task-sample:latest -c "cd /server && make deploy-ci"
.PHONY: test
