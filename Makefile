build:
	docker build -t radio .

run: build
	docker run --env-file ./env radio

remote:
	cat .git/config | grep '\[remote "dokku"\]' || git remote add dokku dokku@radio.timcowlishaw.co.uk

deploy: remote
	git push dokku master
