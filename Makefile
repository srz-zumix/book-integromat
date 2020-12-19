help: ## show help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sed -e 's/^GNUmakefile://' | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

build: ## build local
	docker run -it --rm -v "$(PWD)/book-integromat":/work -w /work kauplan/review2.5 rake preproc all

clean:
	docker run -it --rm -v "$(PWD)/book-integromat":/work -w /work kauplan/review2.5 rake clean

# https://github.com/marketplace/actions/interact-with-google-drive
# 0. cp skicka/env-sample.sh skicka/env.sh
# 1. set your clientId/Auth in skicka/env.sh (GOOGLE_CLIENT_ID/GOOGLE_CLIENT_SECRET)
# 2. make setup-skicka
# 3. open url
# 4. copy code
setup-skicka: ## setup skicka
	docker run --rm -it --entrypoint "" -v $(PWD):/work satackey/skicka sh -c "/work/skicka/setup.sh"
