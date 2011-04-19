package Test::Builder2::Types;

use Test::Builder2::Mouse ();
use Test::Builder2::Mouse::Util qw(load_class);
use Test::Builder2::Mouse::Util::TypeConstraints;


=head1 NAME

Test::Builder2::Types - Mouse types used by Test::Builder2

=head1 SYNOPSIS

    use Test::Builder2::Types;

=head1 DESCRIPTION

This defines custom Mouse types used by Test::Builder2.

=head2 Types

=head3 Test::Builder2::Positive_Int

An integer greater than or equal to zero.

=cut

subtype 'Test::Builder2::Positive_Int' => (
    as 'Int',
    where { defined $_ && $_ >= 0 },
);


=head3 Test::Builder2::LoadableClass

A class name.  It will be loaded.

=cut

subtype 'Test::Builder2::LoadableClass', as 'ClassName';
coerce 'Test::Builder2::LoadableClass', from 'Str', via { load_class($_); $_ };


=head3 Test::Builder2::Label

This is a string but will also accept undef and turn it into an empty string.

=cut

subtype 'Test::Builder2::Label', as 'Str';
coerce  'Test::Builder2::Label', from 'Undef',  via { "" };
coerce  'Test::Builder2::Label', from 'Object', via { "$_" };


enum 'Test::Builder2::Result::results' => qw(pass fail skip);


no Test::Builder2::Mouse::Util::TypeConstraints;

1;
