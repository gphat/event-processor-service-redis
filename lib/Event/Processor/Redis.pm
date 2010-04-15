package Event::Processor::Redis;
use Moose;
use strict;
use warnings;

use Redis;

has server => (
    is => 'ro',
    isa => 'Str',
    default => '127.0.0.1:6379'
);

has debug => (
    is => 'ro',
    isa => 'Bool',
    default => 0
);

has '_redis' => (
    is => 'ro',
    isa => 'Redis',
    lazy_build => 1,
    handles => [qw(exists expire get llen rpush set)]
);

sub _build__redis {
    my ($self) = @_;

    Redis->new(
        server => $self->server,
        debug  => $self->debug
    );
}

sub _verify_redis_connection {
    my ($self) = @_;

    try {
        $self->_redis->ping;
    } catch {
        $self->_redis(
            Redis->new(
                server => $self->server,
                debug  => $self->debug
            )
        );
    };
}

1;