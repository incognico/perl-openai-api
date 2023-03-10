package OpenAI::API::Resource::File::Retrieve;

use strict;
use warnings;

use Types::Standard qw(Str);

use Moo;
use strictures 2;
use namespace::clean;

has file_id => ( is => 'ro', isa => Str, required => 1 );

sub endpoint {
    my ($self) = @_;
    return 'files/' . $self->{file_id};
}

1;

__END__

=head1 NAME

OpenAI::API::Resource::File::Retrieve - retrieve file details

=head1 DESCRIPTION

Returns information about a specific file.

=head1 METHODS

=head2 new()

=over

=item file_id

=back

=head1 SEE ALSO

OpenAI API Documentation: L<Files|https://platform.openai.com/docs/api-reference/files>
