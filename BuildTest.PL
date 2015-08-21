use strict;
use warnings;
use Module::Build;

my $build = Module::Build->resume( properties => { config_dir => '_build', }, );

$build->dispatch('build');
$build->dispatch('test');
$build->dispatch('testcover');
