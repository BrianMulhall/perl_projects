use utf8;
package App::Schema::Result::User;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

App::Schema::Result::User

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<users>

=cut

__PACKAGE__->table("users");


=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 age

  data_type: 'integer'
  is_nullable: 0

=head2 firstname

  data_type: 'varchar'
  is_nullable: 0
  size: 45

=head2 lastname

  data_type: 'varchar'
  is_nullable: 0
  size: 45

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "age",
  { data_type => "integer", is_nullable => 0 },
  "firstname",
  { data_type => "varchar", is_nullable => 0, size => 45 },
  "lastname",
  { data_type => "varchar", is_nullable => 0, size => 45 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-05-12 09:07:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:AcER3HI8eP6KtrRs91+81g


# You can replace this text with custom code or comments, and it will be preserved on regeneration


sub fullname {
    my $self = shift;
    return $self->firstname . ' ' . $self->lastname;
}

1;
