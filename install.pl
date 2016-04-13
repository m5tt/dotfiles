#!/usr/bin/perl

use utf8;
use strict;
use warnings;
use File::Copy 'move';

my $home_dir = $ENV{'HOME'} . '/';

my $dotfiles_dir = `pwd`;
chomp $dotfiles_dir;
$dotfiles_dir .= '/';

my $old_dotfiles_dir = $home_dir . '.old_dotfiles/';
my @ignore_files = ('install.pl', '.', '..', @ARGV);

## Open current dir (dotfiles) and put all the dotfiles in @dotfiles
opendir(my $dir_fh, '.') or die $!;
my @dotfiles = readdir($dir_fh);
closedir($dir_fh);

print "Creating $old_dotfiles_dir\n";
mkdir $old_dotfiles_dir;

## Skip any files in @ignore_files, move any old dotfiles then creat symlinks to dotfiles in $dotfiles_dir
for my $current_dotfile (@dotfiles)
{
    next if $current_dotfile ~~ @ignore_files;

    my $home_dotfile = $home_dir . '.' . $current_dotfile;
    move($home_dotfile, $old_dotfiles_dir) if -e $home_dotfile;

    print "Creating symlink to $current_dotfile in home directory\n";
    symlink($dotfiles_dir . $current_dotfile, $home_dotfile) or print "$!\n";
}
