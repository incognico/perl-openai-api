#!perl

use strict;
use warnings;
use Test::More;
use Test::Deep;
use Test::RequiresInternet;

use OpenAI::API;

if ( !$ENV{OPENAI_API_KEY} ) {
    plan skip_all => 'This test requires an OPENAI_API_KEY environment variable';
}

my $openai = OpenAI::API->new();

my @test_cases = (
    {
        method => 'chat',
        params => {
            model       => 'gpt-3.5-turbo',
            messages    => [ { "role" => "user", "content" => "Hello!" }, ],
            max_tokens  => 100,
            temperature => 0,
        },
        expected_message => {
            role    => 'assistant',
            content => re('\b(?:Hello|Hi|Hey)\b'),
        },
    },
);

for my $test (@test_cases) {
    my ( $method, $params, $expected_message ) = @{$test}{qw/method params expected_message/};

    my $response = $openai->$method( %{$params} );

    cmp_deeply( $response->{choices}[0]{message}, $expected_message );
}

done_testing();
