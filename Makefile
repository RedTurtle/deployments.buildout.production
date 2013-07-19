.PHONY: getplone

BASE_URL=https://github.com/RedTurtle

get_haproxy:
	wget https://github.com/RedTurtle/deployments.buildout.haproxy/archive/master.zip
	unzip master.zip
	mv deployments.buildout.haproxy-master/ components/haproxy
	rm master.zip

get_plone:
	wget https://github.com/RedTurtle/deployments.buildout.plone/archive/master.zip
	unzip master.zip
	mv deployments.buildout.plone-master/ components/plone
	rm master.zip

get_varnish:
	wget https://github.com/RedTurtle/deployments.buildout.varnish/archive/master.zip
	unzip master.zip
	mv deployments.buildout.varnish-master/ components/varnish
	rm master.zip

get_all: get_haproxy get_plone get_varnish
