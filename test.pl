#!/usr/local/bin/perl -w

# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

#########################

use Test;
BEGIN { plan tests => 2 };
use Image::WMF;
ok(1); # If we made it this far, we're ok.
test1();

#########################


sub test1 {
	my $im = new Image::WMF(200,200);
	my $red = $im->colorAllocate(255,0,0);
	my $blue = $im->colorAllocate(0,0,255);
	$im->filledRectangle(20,20,50,50,$red);
	$im->string(gdSmallFont,20,20,"My first WMF!", $blue);

	$wmfdata = $im->wmf;

	open(OUT, ">test.wmf") or warn "Can't create WMF file: !$\n";
	print OUT $wmfdata;
	close(OUT);
	if (-e "test.wmf" && -s "test.wmf" > 0){
		print "ok 2\n";
	} else {
		print "not ok 2\n";
	}
	
}
