build:
	docker build -t radio .

run: build
	docker run --env-file ./env radio

deploy:
	git remote add dokku dokku@radio.timcowlishaw.co.uk:radio
	git push dokku master
