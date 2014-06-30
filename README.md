[![Build Status](https://travis-ci.org/RedTurtle/deployments.buildout.production.png?branch=master)](https://travis-ci.org/RedTurtle/deployments.buildout.production)
deployments.buildout.production
===============================

A buildout template that pulls in supervisor.

How to make a copy of this buildout
-----------------------------------
Launch those lines
```bash
wget https://github.com/RedTurtle/deployments.buildout.production/archive/master.zip
unzip master.zip
rm master.zip
cd deployments.buildout.production-master
make quickstart
```

For the impatients
------------------
Those are the commands you want to run
```bash
virtualenv-2.7 --no-site-packages -p /usr/bin/python2.7 .
. bin/activate
ln -sf profiles/simple.cfg buildout.cfg
./bin/python2.7 bootstrap.py
./bin/buildout
```

This will give you, in the `bin` folder a bunch of commands to control your
deployment:
- fab
- supervisord
- supervisorctl
- start (alias for supervisord)
- status (alias for supervisorctl status)
- restart (alias for supervisorctl shutdown && wait some time && supervisord)
- stop (alias for supervisorctl shutdown)
- graceful (alias for supervisorctl restart all)

In addition it will install in the `etc` folder an init script for debian like
systems.
This script can be copied with a descriptive name in the `/etc/init.d` system
directory and activated for autostart, e.g.::
```
cp etc/initscript /etc/init.d/deployment.buildout.production
update-rc.d deployment.buildout.production defaults
```
Check the file for more detailed instructions.

The configuration for supervisor can be checked in the supervisor part
folder (`parts/supervisor/supervisord.conf`)

Configuration
-------------

To correctly prepare the initscript change the `name` parameter
in the `[initscript]` session:
```config
[initscript]
name = www.example.com
```

If you want supervisord to run as a different user,
modify `supervisord-user` in the `[supervisor]` section, e.g.:

```config
[supervisor]
supervisord-user = plone
```

Connect only some components
----------------------------
To connect only some components
you should not use `make quickstart`,
but after getting a copy of this buildout
you can run:

```bash
make get_$(COMPONENT)
```
where `$(COMPONENT)` is one of the following:
 * haproxy
 * plone
 * varnish

This will download the `$(COMPONENT)` buildout
to the `./components/$(COMPONENT)` directory.

To get all the known components just launch:
```bash
make get_all
```

If you want to remove some components
just delete the relative folder
in the `components` directory, e.g::
```bash
rm -rf components/varnish
```

Remember to comment/uncomment the wanted supervisor programs!
