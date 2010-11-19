package App::DueDates::Schema::Result::Task;

use base qw/DBIx::Class::Core/;

__PACKAGE__->load_components(qw/InflateColumn::DateTime Timestamp/);
__PACKAGE__->table('tasks');
__PACKAGE__->add_columns(

    "taskid" => {
        data_type => "integer",
        is_auto_increment => 1,
        is_nullable => 1,
    },

    "name" => {
        data_type => "varchar",
        size      => "100",
        is_nullable => 0,
    },

    "description" => {
        data_type => "varchar",
        size      => "1024",
        is_nullable => 1,
    },

    "due_on" => {
        data_type => "date",
        is_nullable => 0,
    },

    "created_at" => {
        data_type => "datetime",
        set_on_create => 1,
    },

    "updated_at" => {
        data_type => "datetime",
        set_on_create => 1,
        set_on_update => 1,
    },
);

__PACKAGE__->set_primary_key("taskid");

__PACKAGE__->has_many("task_list" => "App::DueDates::Schema::Result::TaskList", "taskid");

1;
