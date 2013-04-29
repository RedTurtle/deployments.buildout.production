"""
Commands available to deploy using rt.commands
"""
# this is necessary to make the fabric commands available
from fabric.api import env
from rt.commands import *
from rt.commands.project import *
from rt.commands.buildout_components import *

# General metadata

# This is the trac/svn/ name
# Default: ""
env.project_name = ""

# This is the buildout repository
# Either SVN or GIT buildout repository
env.buildout_repo = ""

# This is the main python version
env.python_version = '2.7'

# This is the buildout script to use
env.buildout_cfg = 'buildout.cfg'

# And some host
env.staging_host = ''
env.production_host = ''
