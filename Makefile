new:
	docker build -t rails-tutorial .
	docker run --rm -v ${PWD}:/app -w /app rails-tutorial rails new ${APP}
	sudo chown -R ${USER}:${USER} ${APP}
	rm -rf ${APP}/.git
	cp -r devcontainer ${APP}/.devcontainer

.PHONY: new
