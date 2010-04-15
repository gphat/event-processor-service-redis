use inc::Module::Install;

name     'Event-Processor-Service-Redis';
all_from 'lib/Event/Processor/Service/Redis.pm';
author   q{Cory G Watson <gphat@cpan.org>};
license  'perl';

build_requires 'Test::More';

requires 'Bread::Board';
requires 'Event::Processor';
requires 'Moose';
requires 'Redis';
requires 'Try::Tiny';

WriteAll;

