requires 'utf8';
requires 'strictures';
requires 'namespace::clean';

requires 'CHI';
requires 'Data::Serializer';
requires 'Digest::MD5';
requires 'Moo';
requires 'JSON';
requires 'REST::Client';
requires 'Role::REST::Client';
requires 'Sereal';
requires 'Types::Standard';

on build => sub {
    requires 'Module::Build', '0.28';
};

on test => sub {
    requires 'Carp';
    requires 'Dist::Zilla::App::Command::cover';
    requires 'File::Find';
    requires 'File::Temp';
    requires 'Scalar::Util';
    requires 'Test::More', '0.94';
};

on develop => sub {
    requires 'Dist::Milla', 'v1.0.20';
    requires 'Pod::Coverage::TrustPod';
    requires 'Test::CPAN::Meta';
    requires 'Test::EOL';
    requires 'Test::MinimumVersion';
    requires 'Test::More', '0.88';
    requires 'Test::Pod', '1.41';
    requires 'Test::Pod::Coverage', '1.08';
};
