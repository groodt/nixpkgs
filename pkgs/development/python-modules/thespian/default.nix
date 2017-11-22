{ stdenv, fetchPypi, buildPythonPackage, lib }:

buildPythonPackage rec {
  version = "3.8.3";
  pname = "thespian";
  name = "${pname}-${version}";

  src = fetchPypi {
    inherit pname version;
    extension = "zip";
    sha256 = "0vvwsh3waxd5ldrayr86kdcshv07bp361fl7p16g9i044vklwly4";
    # fdbbea4edb6bad0ac0e53fc7bc6970e78e12eef4944aa4146bcdcb573201676c";
  };

  # Do not run the test suite: it takes a long type and uses
  # significant system resources.  Thespian tests are performed via
  # it's Travis CI configuration and do not need to be duplicated
  # here.
  doCheck = false;

  meta = with lib; {
    description = "Python Actor concurrency library";
    homepage = http://thespianpy.com/;
    license = licenses.mit;
    maintainers = [ maintainers.kquick ];
  };
}
