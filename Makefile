build:
	docker build -t radio .

run: build
	docker run -p 5000:5000 --env-file ./env.developmnet -it radio

remote:
	cat .git/config | grep '\[remote "dokku"\]' || git remote add dokku dokku@radio.timcowlishaw.co.uk

deploy: remote
	git push dokku master
