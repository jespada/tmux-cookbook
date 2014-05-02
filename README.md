tmux Cookbook
=============
Installs and configure tmux


Requirements
------------
Platform with a package named 'tmux'. Does a source install on RHEL family.


Attributes
----------
- `node['tmux']['install_method']` - source or package, uses the appropriate recipe.
- `node['tmux']['version']` - version of tmux to download and install from source.
- `node['tmux']['checksum']` - sha256 checksum of the tmux tarball
- `node['tmux']['configure_options']` - array of command line options passed as arguments to the configure script when installing from source.


Usage
-----
Use the recipe for the installation method you want to use, or set the attribute on the node to install from that recipe and use the default recipe. The default recipe also manages `/etc/tmux.conf`.

On RHEL family, `node['tmux']['install_method']` is set to source by default. To install from package, the `yum::epel` recipe is required to get the tmux package, and the attribte would need to be set explicitly.

When installing from source, an install prefix can be set with the `configure_options` attribute. For example:

```ruby
default['tmux']['configure_options'] << "--prefix=/opt/tmux"
```

There are two "private" recipes, `package`, and `source` that are not meant to be included directly in a run_list. They are used by the default recipe and toggled with the node attribute `install_method`.
