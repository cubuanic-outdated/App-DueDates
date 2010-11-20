#!/usr/bin/env perl

{
package App::DueDates::Deploy;

    use Moo;
    with ('App::DueDates::Storable');

    sub build_schema {
        my $self = shift;
        my $schema = $self->schema;
        $schema->deploy({ add_drop_table => 2 });
    }
}

my $app = App::DueDates::Deploy->new;
$app->build_schema;
