package App::DueDates;
    
use Moo;
use Web::Simple __PACKAGE__;
with ('App::DueDates::Templatable');
with ('App::DueDates::Storable');
use Data::Dumper;
dispatch {
    sub (GET + /) {
        [ 200, [ 'Content-type', 'text/html' ], [ shift->write('index.tt') ], ],
    },

    sub (POST + /task/new + %*) {
        my ($self, $params) = @_;
        my $task = $self->schema->resultset("Task")->create({
            name => $params->{"name"},
            description => $params->{"description"},
            due_on => $params->{"due_on"},
        }) or die "Can't create record: $!";
        
        return [200, ['Content-type', 'text/html'], [ $self->write("tasks/create.tt", { task => $task } )], ];
    }
};
1;
