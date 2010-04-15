package #
    Rule::True;
use Moose;

with 'Event::Processor::Rule';

sub condition {
    my ($self, $kernel, $event) = @_;

    return 1;
}

sub result {
    my ($self, $kernel, $event) = @_;

    my $redis = $kernel->fetch('redis')->get;
    my $prev = $redis->get('e-p-test-x');
    if(defined($prev)) {
        $redis->set('e-p-test-y', $event->id);
    } else {
        $redis->set('e-p-test-x', $event->id);
    }
}