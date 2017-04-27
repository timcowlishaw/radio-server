build:
	docker build -t radio .

setup-db:
	./setup-db.sh

run: build setup-db
	docker run -p 5000:5000 --env-file ./env.development -it radio

remote:
	cat .git/config | grep '\[remote "dokku"\]' || git remote add dokku dokku@radio.timcowlishaw.co.uk

deploy: remote
	git push dokku master
