package App::DueDates::Schema::Result::TaskList;

use base qw/DBIx::Class::Core/;

__PACKAGE__->load_components(qw/InflateColumn::DateTime Timestamp/);
__PACKAGE__->table('task_lists');
__PACKAGE__->add_columns(

    "taskid" => {
        data_type => "integer",
        is_auto_increment => 1,
        is_nullable => 1,
    },

   "listid" => {
        data_type => "integer",
        is_auto_increment => 1,
        is_nullable => 1,
    },
);

__PACKAGE__->set_primary_key(qw/ taskid listid /);
__PACKAGE__->belongs_to("task" => "App::DueDates::Schema::Result::Task", "taskid");
__PACKAGE__->belongs_to("list" => "App::DueDates::Schema::Result::List", "listid");

1;
