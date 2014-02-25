postinstall-scripts
===================

A collection of post install scripts for configuring security, development environments, and servers on debian. Just here to make things easier. Very, very heavily influenced by crunchbang's post install scripts(cb-welcome), although no longer sharing any code I think. They are intended to install and configure packages that tighten security, ease system administration, set up web-servers, development environments, and communications tools. These scripts will install Free Software Only.

One goal of these post install scripts is to make it easy for new scripts to be written and plugged into this system. Each post install script consists of an array which contains [0]:A short description of what the script does [1]:A long description of what the script does and a list of what packages it will try to install and [2]:A list of packages it will try to to install, as well as a function which will contain all the instructions to be executed by the script. These will become more useful soon.
