package App::Schema::ResultSet::User;
use base 'DBIx::Class::ResultSet';

sub age_less_than {
   my $self = shift;
   my $age  = shift;
   return $self->find({ age => { '<' => $age }});
}

1;