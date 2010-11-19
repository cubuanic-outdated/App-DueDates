package App::DueDates::Templatable;

use Moo::Role;
use Template;
use Path::Class qw/dir/;

has 'tt' => (
    is => 'ro',
    isa => 'Template',
    lazy => 1, 
    default => sub { 
        Template->new({ 
            INCLUDE_PATH => dir('root', 'site') . "",
            WRAPPER      => 'wrapper.tt',
            COMPILE_DIR  => dir('root', 'tt_cache') . "",
        });
    },
);

sub write {
    my ( $self, $template, $params ) = @_;
    my $tt = $self->tt;
    my $output;
    $tt->process( $template, $params, \$output ) ||
        die $tt->error;
    return $output;
}

1;
