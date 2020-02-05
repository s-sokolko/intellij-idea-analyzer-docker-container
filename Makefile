name=sokolko/intellij-idea-analyzer

build:
	sudo docker build -t $(name):latest --no-cache .


push:
	sudo docker login
	sudo docker push $(name):latest

