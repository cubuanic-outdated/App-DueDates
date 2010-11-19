package App::DueDates;
    
use Moo;
use Web::Simple __PACKAGE__;
with ('App::DueDates::Templatable');
with ('App::DueDates::Storable');

dispatch {
    sub (GET + /) {
        [ 200, [ 'Content-type', 'text/html' ], [ shift->write('index.tt') ], ],
    }
};
1;
