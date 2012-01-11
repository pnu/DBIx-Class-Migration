package Local::SchemaV1::Result::Cd;
use base qw/DBIx::Class::Core/;

__PACKAGE__->table('cd');
__PACKAGE__->add_columns(
  'cd_id' => {
    data_type => 'integer',
  },
  'artist_fk' => {
    data_type => 'integer',
  },
  'title' => {
    data_type => 'varchar',
    size => '96',
  });

__PACKAGE__->set_primary_key('cd_id');

__PACKAGE__->belongs_to(
  'artist' => 'Local::SchemaV1::Result::Artist',
  {'foreign.artist_id'=>'self.artist_fk'});

__PACKAGE__->has_many(
  'track_rs' => 'Local::SchemaV1::Result::Track',
  {'foreign.cd_fk'=>'self.cd_id'});

1;
