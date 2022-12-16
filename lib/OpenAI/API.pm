package OpenAI::API;

use strict;
use warnings;
use LWP::UserAgent;
use JSON::MaybeXS;

our $VERSION = 0.01;

sub new {
    my ( $class, %params ) = @_;
    my $self = {
        api_key  => $params{api_key} // $ENV{OPENAI_KEY},
        endpoint => $params{endpoint} || 'https://api.openai.com/v1/',
    };
    return bless $self, $class;
}

sub completions {
    my ( $self, %params ) = @_;
    my $ua = LWP::UserAgent->new();

    my $req = HTTP::Request->new(
        POST => "$self->{endpoint}completions",
        [
            'Content-Type'  => 'application/json',
            'Authorization' => "Bearer $self->{api_key}",
        ],
        encode_json( \%params ),
    );

    return $ua->request($req);
}

1;

__END__

=head1 NAME

OpenAI::API - A Perl module for accessing the OpenAI API

=head1 SYNOPSIS

    use OpenAI::API;

    my $openai = OpenAI::API->new( api_key => 'YOUR_API_KEY' );

    my $response = $openai->completions(
        model             => 'text-davinci-003',
        prompt            => 'What is the capital of France?',
        max_tokens        => 2048,
        temperature       => 0.5,
        top_p             => 1,
        frequency_penalty => 0,
        presence_penalty  => 0
    );

=head1 DESCRIPTION

OpenAI::API is a Perl module that provides an interface to the OpenAI API,
which allows you to generate text, translate languages, summarize text,
and perform other tasks using the language models developed by OpenAI.

To use the OpenAI::API module, you will need an API key, which you can obtain by
signing up for an account on the OpenAI website (https://beta.openai.com/).

=head1 METHODS

=head2 new

Creates a new OpenAI::API object.

=over 4

=item api_key (optional if you set the OPENAI_KEY environment variable)

Your API key. Defaults to the value of C<$ENV{OPENAI_KEY}>.

=item endpoint (optional)

The endpoint URL for the OpenAI API. Defaults to 'https://api.openai.com/v1/'.

=back

=head2 completions

Sends a request to the OpenAI API to generate text.

See 'https://beta.openai.com/docs/api-reference/completions/create'.

=over 4

=item model

The name of the language model to use.

See 'https://beta.openai.com/docs/api-reference/models'.

=item prompt

The prompt for the text generation.

=item max_tokens (optional)

The maximum number of tokens to generate.

=item temperature (optional)

The temperature to use for sampling.

=item top_p (optional)

The top-p value to use for sampling.

=item frequency_penalty (optional)

The frequency penalty to use for sampling.

=item presence_penalty (optional)

The presence penalty to use for sampling.

=back

=head1 SEE ALSO

https://beta.openai.com/docs/api-reference/overview

=head1 AUTHOR

Nelson Ferraz <lt>nferraz@gmail.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2022 by Nelson Ferraz

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.30.2 or,
at your option, any later version of Perl 5 you may have available.

=cut
