package App::DueDates::Config;
use Moo::Role;
use Config::JFDI;

has 'file' => (
    is => 'ro',
   # required => 1,
    lazy => 1,
    default => sub { "app_duedates.conf" },
);

sub config {
    my $self = shift;
    my $cfg = Config::JFDI->new( file => $self->file );
    return $cfg->get;
}
    


1;
