.PHONY: get_all get_haproxy get_plone get_varnish lucky quickstart

PATH := .:$(PATH)


BASE_URL=https://github.com/RedTurtle

lucky:
	./.imfeelinglucky.sh

get_haproxy:
	wget https://github.com/RedTurtle/deployments.buildout.haproxy/archive/master.zip
	unzip master.zip
	mv deployments.buildout.haproxy-master/ components/haproxy
	rm master.zip
	@echo "TIP: uncomment component lines in supervisor programs"

get_plone:
	wget https://github.com/RedTurtle/deployments.buildout.plone/archive/master.zip
	unzip master.zip
	mv deployments.buildout.plone-master/ components/plone
	rm master.zip
	@echo "TIP: uncomment component lines in supervisor programs"

get_varnish:
	wget https://github.com/RedTurtle/deployments.buildout.varnish/archive/master.zip
	unzip master.zip
	mv deployments.buildout.varnish-master/ components/varnish
	rm master.zip
	@echo "TIP: uncomment component lines in supervisor programs"

get_all: get_haproxy get_plone get_varnish

quickstart: lucky

components:
	./bin/fab component_buildout
