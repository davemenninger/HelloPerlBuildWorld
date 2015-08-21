use strict;
use warnings;
use Test::More qw(no_plan);

# Verify module can be included via "use" pragma
BEGIN { use_ok('HelloPerlBuildWorld') }

# Verify module can be included via "require" pragma
require_ok('HelloPerlBuildWorld');

# Test hello() routine using a regular expression
my $helloCall = HelloPerlBuildWorld::hello();
like( $helloCall, qr/Hello, .*World/, "hello() RE test" );

# Test hello_message() routine using a got/expected routine
is( $helloCall, "Hello, Perl Build World!", "hello() IS test" );

# Do not test bye() routine
# actually, do...
my $byCall = HelloPerlBuildWorld::bye();
like( $byCall, qr/cruel/, "bye() RE test" );

# Test repeat() routine using a got/expected routine
for ( my $ctr = 1 ; $ctr <= 10 ; $ctr++ ) {
    my $repeatCall = HelloPerlBuildWorld::repeat();
    is( $repeatCall, 1, "repeat() IS test" );
}

# Test argumentTest()
my $argumentTestCall1 = HelloPerlBuildWorld::argumentTest();
is( $argumentTestCall1, "null", "argumentTest() IS null test" );

# Test argumentTest("true")
my $argumentTestCall2 = HelloPerlBuildWorld::argumentTest("true");
is( $argumentTestCall2, "true", "argumentTest() IS true test" );

# Test argumentTest("false")
my $argumentTestCall3 = HelloPerlBuildWorld::argumentTest("false");
is( $argumentTestCall3, "false", "argumentTest() IS false test" );

# Test argumentTest(123)
my $argumentTestCall4 = HelloPerlBuildWorld::argumentTest(123);
is( $argumentTestCall4, "unknown", "argumentTest() IS unknown test" );
