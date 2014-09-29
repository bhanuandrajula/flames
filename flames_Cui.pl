#!C:/Perl/bin/perl.exe

use strict;
use Switch;

use CGI;
use CGI::Carp qw(fatalsToBrowser);
use CGI::Pretty qw( :html3 );


my $cgi = new CGI();



our $scalar_str1= $cgi->param('malename');
our $scalar_str2= $cgi->param('femalename');

our $malename = $scalar_str1;
our $femalename = $scalar_str2;

our $char = ();
our $remove = ();
our $count = 0;

our $count_of_String = 0; 

our $scalar_flames = "flames"; 
our @array_flames =();

our $match = ();
our $previous = ();
our $after = ();
our $flamesrelation = ();


#method to get non common characters of two strings
getNonCommonElements($scalar_str1,$scalar_str2);

#method to traverse to the string "flames" based on NonCommonElements count value
flamesTraverse();


sub getNonCommonElements{
	
	$scalar_str1 = shift;
	$scalar_str2 = shift;
	
	my @array_str1 = split //,"$scalar_str1";
    my @array_str2 = split //,"$scalar_str2";
	
    for $char (@array_str1)
    {
	    if(grep /$char/, @array_str2){ 
		$scalar_str1 =~s/$char//i;
		$scalar_str2 =~s/$char//i;
		}else{
	    	#print "Notmatching\n";
    	}
	} 

    #print "Final string1= $scalar_str1\n";
    #print "Final string2= $scalar_str2\n";

    my $scalar_Jointstring = $scalar_str1.$scalar_str2;
    my @array_Jointstring = split //,"$scalar_Jointstring";

    #print "NonCommonElements = @array_Jointstring\n";

    $count_of_String = @array_Jointstring;
    #print "Count of NonCommonElements = $count_of_String\n";

    @array_flames = split //,"$scalar_flames";

}


sub flamesTraverse
{
	 
 $count = 0;	
 for(my $loopCounter=0;$loopCounter<=$count_of_String-1;$loopCounter++){
   foreach my $char (@array_flames){
   		#print "Value =$cc\n";
		#print "Count =$count\n";
		#print "Scalarflames = $scalar_flames\n";
		if($count == $count_of_String-1)
		{
			#print "calling remove method\n";
			#print "cc=$cc\n";
			#Method to remove the character from the string "flames"
			removeChar($char);
			#$count = 0;
		}
	  $count++;
    }	
  }
}


sub removeChar{
	
	my $remove = shift;
    #print "Scalar of flames = $scalar_flames\n";
    #print "Removing character =======> $remove\n";
    if($scalar_flames =~m/$remove/){
    	 $match = $&;
    	 $previous = $`;
    	 $after = $';
    	 #print "match  =#$match# , previous = #$previous#, after = #$after#\n";
    }
    
    $scalar_flames =~s/$remove//i;
    #print "Scalar flames = $scalar_flames\n";
    $scalar_flames = $after.$previous;
    #print "Final scalar flames = $scalar_flames\n";
    
    @array_flames = split //,"$scalar_flames";
    #print "array of flames =@array_flames\n";
    my $length = @array_flames;
    #print "Lenght = $length\n";
    if($length ==1)
    {
    	#Method to find the relation between two strings
    	Findrelation(@array_flames);
    }
    flamesTraverse();
}

sub Findrelation {
	my $relation = shift;
	switch($relation){
		case "f" { $flamesrelation = "FRIEND"};
		case "l" { $flamesrelation = "LOVE"};
		case "a" { $flamesrelation = "AFFECTION"};
		case "m" { $flamesrelation = "MARRIAGE"};
		case "e" { $flamesrelation = "ENEMY"};
		case "s" { $flamesrelation = "SISTER"};
	}
	
	writeHtml($flamesrelation);
	
}

sub writeHtml{
	
	print $cgi->header;
	print $cgi->h1("Welcome to Flames");
	print $cgi->h2("Entered Male name is $malename");
	print $cgi->h2("Entered Female name is $femalename");
	print $cgi->h2("Flames Result is $flamesrelation");
	exit;
}



