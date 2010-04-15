package Event::Processor::Service::Redis;
use Moose;
use warnings;
use strict;

our $VERSION = '0.01';

extends 'Bread::Board::ConstructorInjection';
with 'Bread::Board::LifeCycle::Singleton';

has '+name' => ( default => 'redis' );
has '+class' => ( default => 'Event::Processor::Redis' );

1;

__END__

=head1 NAME

Event::Processor::Service::Redis - Redis storage service for Event::Processor

=head1 SYNOPSIS

    my $proc = Event::Processor->new;
    $proc->kernel->add_service(
        Event::Processor::Service::Redis->new
    );

=head1 AUTHOR

Cory G Watson, C<< <gphat at cpan.org> >>

=head1 COPYRIGHT & LICENSE

Copyright 2010 Cory G Watson.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut
