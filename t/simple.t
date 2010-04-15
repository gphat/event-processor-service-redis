use Test::More;

use Event::Processor;
use Event::Processor::Event;
use Event::Processor::Rule;
use Event::Processor::Service::Redis;
use Rule::True;

my $proc = Event::Processor->new;
$proc->kernel->add_service(
    Event::Processor::Service::Redis->new
);

my $rule = Rule::True->new;

$proc->set_rule('foo.bar', $rule);

my $event = Event::Processor::Event->new(
    id => 1,
    name => 'foo.bar'
);

$proc->process($event);

my $event2 = Event::Processor::Event->new(
    id => 2,
    name => 'foo.bar'
);

$proc->process($event2);

my $redis = $proc->kernel->fetch('redis')->get;
cmp_ok($redis->get('e-p-test-y'), '==', 2, 'found redis value');

done_testing;