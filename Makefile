new:
	docker build -t rails-tutorial .
	docker run --rm -v ${PWD}:/app -w /app rails-tutorial rails new ${APP}
	sudo chown -R ${USER}:${USER} ${APP}

.PHONY: new
