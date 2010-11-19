package App::DueDates::Schema::Result::List;

use base qw/DBIx::Class::Core/;

__PACKAGE__->load_components(qw/InflateColumn::DateTime Timestamp/);
__PACKAGE__->table('lists');
__PACKAGE__->add_columns(

    "listid" => {
        data_type => "integer",
        is_auto_increment => 1,
        is_nullable => 1,
    },

    "name" => {
        data_type => "varchar",
        size      => "100",
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

__PACKAGE__->set_primary_key("listid");

__PACKAGE__->has_many("task_list" => "App::DueDates::Schema::Result::TaskList", "listid");

1;
