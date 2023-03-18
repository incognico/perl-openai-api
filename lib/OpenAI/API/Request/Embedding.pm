package OpenAI::API::Request::Embedding;

use strict;
use warnings;

use Moo;
use strictures 2;
use namespace::clean;

extends 'OpenAI::API::Request';

use Types::Standard qw(Bool Str Num Int Map);

has model => ( is => 'rw', isa => Str, required => 1, );
has input => ( is => 'rw', isa => Str, required => 1, );

has user => ( is => 'rw', isa => Str, );

sub endpoint { 'embeddings' }
sub method   { 'POST' }

1;

__END__

=head1 NAME

OpenAI::API::Request::Embedding - embeddings endpoint

=head1 SYNOPSIS

    use OpenAI::API::Request::Embedding;

    my $request = OpenAI::API::Request::Embedding->new(
        model => "text-embedding-ada-002",
        input => "The food was delicious and the waiter...",
    );

    my $res = $request->send();

=head1 DESCRIPTION

Get a vector representation of a given input that can be easily consumed
by machine learning models and algorithms.

=head1 METHODS

=head2 new()

=over 4

=item * model

=item * input

=item * user [optional]

=back

=head2 send()

=head2 send($openai_config)

Sends the request and returns a data structured similar to the one
documented in the API reference.

=head1 SEE ALSO

OpenAI API Reference: L<Embeddings|https://platform.openai.com/docs/api-reference/embeddings>
