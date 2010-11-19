package App::DueDates::Storable;
use Moo::Role;
use App::DueDates::Schema;
with ('App::DueDates::Config');

has 'schema' => (
    is => 'ro',
    isa => 'DBIx::Class::Schema',
#    required => 1,
    lazy => 1,
    default => sub {
        return App::DueDates::Schema->connect(@{ shift->config->{'Database'}{'connect_info'} })
    },
);



1;
