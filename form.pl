#!C:/Perl/bin/perl.exe

use strict;
use warnings;
use CGI;
use CGI::Carp qw(fatalsToBrowser);
use CGI::Pretty qw( :html3 );

my $cgi = new CGI;
our $malename = ();
our $femalename = ();

print $cgi->header;

print $cgi->start_html(-title => 'Try webform');

print $cgi->start_ul;
foreach my $name (qw/Jacob Jeremy Jacinta Jenni Jack/)
{
print $cgi->li($name);
print "</br>";
}
print $cgi->end_ul;
#print "</br>";

print $cgi->start_form({-action=>"flames_Cui.pl", -method=>"GET"});
# print form internals.
	print $cgi->h2("Enter names to calculate the Flames");
  print "Malename";
  print $cgi->br;
  print $cgi->textfield(
		-name      => 'malename',
		-label     => "default value",
        -size      => 20,
        -maxlength => 30,
    );
    print $cgi->br;
    print $cgi->br;
    print "Femalename";
    print $cgi->br;
    
    
    print $cgi->textfield(
		-name      => 'femalename',
		-label     => "default value",
        -size      => 20,
        -maxlength => 30,
    );  
    print $cgi->br;
    print $cgi->br;
        print $cgi->submit(
		-value      => 'submit',
		
    );

	print $cgi->br;
	print $cgi->br;
	    
    print $cgi->checkbox({-name=>"send_email",
							-value=>"OFF",
							-checked=>"checked",
							-label=>"New checkbox"});
	print $cgi->br;
	print $cgi->br;							
    
    my %labels = ('fst'=>'your first choice',
					'snd'=>'your second choice',
					'thr'=>'your third choice',
					'fth' => 'your fourth choice');

    print $cgi->checkbox_group({-name=>'group_name',
							-values=>['fst','snd','thr','fth'],
							-default=>['fst','thr'],
							-linebreak=>'true',
							-labels=>\%labels});
							
my %labels1 = ('fst'=>'your first choice',
'snd'=>'your second choice',
'thr'=>'your third choice',
'fth' => 'your fourth choice');
my @values = ('fst','snd','thr','fth');

print $cgi->popup_menu({-name=>'menu_name',
					-values=>\@values,
					-default=>'snd',
					-labels=>\%labels1});							

my @defaults = ('fst','thr');
	print $cgi->br;
	print $cgi->br;	
print $cgi->scrolling_list({-name=>'list_name',
							-values=>\@values,
							-default=>\@defaults,
							-size=>5,
							-multiple=>1,
							-labels=>\%labels});    

print $cgi->end_form();


#print $cgi-> password_field({-name=>"passwd",
#							 -value=>"enter"});    
#	
#	   print $cgi->textarea(
#        -name  => 'textarea1',
#        -value => 'default value',
#        -cols  => 60,
#        -rows  => 3,
#    );
#	    print $cgi->hidden(
#        -name      => 'hidden1',
#        -default   => 'some value',
#    );
#	
#	    my @values = ('value1', 'value2', 'value3');
#    print $cgi->popup_menu(
#        -name    => 'popup1',
#        -values  => \@values,
#        -default => 'value2'
#    );



#print $cgi->fish("My something here");