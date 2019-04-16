use strict;
use warnings;
use v5.28.1;
use Digest::SHA1;
use Digest::MD5;
 
my $ctx = Digest::MD5->new;
 
my $sha1 = Digest::SHA1->new;
 
my $utf8_fh;
my $utf16_bom_fh;
#this actually creates the file handle
open( $utf8_fh, "ascii.txt" ) or die "Could not open file '$utf8_fh' $!";
open( $utf16_bom_fh, "utf_16_bom.txt" ) or die "Could not open file '$utf16_bom_fh' $!";

$ctx->addfile($utf8_fh);
$sha1->addfile($utf8_fh);

say "SHA1 Digest: " . $sha1->hexdigest;
say length($sha1->hexdigest) * 4 . " bits long";

say "MD5 Digest: " . $ctx->hexdigest;
say length($ctx->hexdigest) * 4 . " bits long";

print "\n\n\n\n\n";

$ctx->addfile($utf16_bom_fh);
$sha1->addfile($utf16_bom_fh);

say "SHA1 Digest: " . $sha1->hexdigest;
say length($sha1->hexdigest)* 4 . " bits long";

say "MD5 Digest: " . $ctx->hexdigest;
say length($ctx->hexdigest) * 4 . " bits long" ;


