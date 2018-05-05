requires 'perl', '5.008005';

requires 'Web::API';
requires 'Mouse';

on test => sub {
    requires 'Dist::Zilla::App::Command::cover';
    requires 'Test::More', '0.96';
};
