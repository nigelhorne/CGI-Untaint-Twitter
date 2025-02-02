# NAME

CGI::Untaint::Twitter - Validate a Twitter ID in a CGI script

# DESCRIPTION

`CGI::Untaint::Twitter` is a Perl module designed to validate Twitter/X usernames within CGI applications.
It extends `CGI::Untaint::object` to sanitize and verify Twitter IDs using the [Net::Twitter::Lite::WithAPIv1\_1](https://metacpan.org/pod/Net%3A%3ATwitter%3A%3ALite%3A%3AWithAPIv1_1) library.
The module ensures that a provided username consists only of letters and digits, optionally removing a leading @.
It then checks the validity of the username by querying Twitter’s API,
provided the necessary authentication credentials (consumer\_key, consumer\_secret, access\_token, access\_token\_secret) are set.
If the API rate limit is exceeded, the module assumes the username is valid to avoid disrupting users

# VERSION

Version 0.05

# SYNOPSIS

CGI::Untaint::Twitter is a subclass of CGI::Untaint used to
validate if the given Twitter ID is valid.

    use CGI::Info;
    use CGI::Untaint;
    use CGI::Untaint::Twitter;
    # ...
    my $info = CGI::Info->new();
    my $params = $info->params();
    # ...
    my $u = CGI::Untaint->new($params);
    my $tid = $u->extract(-as_Twitter => 'twitter');
    # $tid will be lower case

# SUBROUTINES/METHODS

## is\_valid

Validates the data.
Returns a boolean if $self->value is a valid twitter ID.

## init

Set various options and override default values.

    use CGI::Info;
    use CGI::Untaint;
    use CGI::Untaint::Twitter {
        access_token => 'xxxxxx', access_token_secret => 'yyyyy',
        consumer_key => 'xyzzy', consumer_secret => 'plugh',
    };

# AUTHOR

Nigel Horne, `<njh at bandsman.co.uk>`

# BUGS

Please report any bugs or feature requests to the author.
This module is provided as-is without any warranty.

Twitter only allows 150 requests per hour.
If you exceed that,
`CGI::Untaint::Twitter` won't validate and will assume all IDs are valid.

Please report any bugs or feature requests to `bug-cgi-untaint-twitter at rt.cpan.org`, or through
the web interface at [http://rt.cpan.org/NoAuth/ReportBug.html?Queue=CGI-Untaint-Twitter](http://rt.cpan.org/NoAuth/ReportBug.html?Queue=CGI-Untaint-Twitter).
I will be notified, and then you'll
automatically be notified of the progress on your bug as I make changes.

# SEE ALSO

[CGI::Untaint](https://metacpan.org/pod/CGI%3A%3AUntaint)

# SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc CGI::Untaint::Twitter

You can also look for information at:

- RT: CPAN's request tracker

    [http://rt.cpan.org/NoAuth/Bugs.html?Dist=CGI-Untaint-Twitter](http://rt.cpan.org/NoAuth/Bugs.html?Dist=CGI-Untaint-Twitter)

- CPAN Ratings

    [http://cpanratings.perl.org/d/CGI-Untaint-Twitter](http://cpanratings.perl.org/d/CGI-Untaint-Twitter)

- Search CPAN

    [http://search.cpan.org/dist/CGI-Untaint-Twitter](http://search.cpan.org/dist/CGI-Untaint-Twitter)

# ACKNOWLEDGEMENTS

# LICENSE AND COPYRIGHT

Copyright 2012-2025 Nigel Horne.

This program is released under the following licence: GPL

# POD ERRORS

Hey! **The above document had some coding errors, which are explained below:**

- Around line 19:

    Non-ASCII character seen before =encoding in 'Twitter’s'. Assuming UTF-8
