{ stdenv, fetchzip, ocaml, findlib, gen, ppx_tools_versioned }:

if !stdenv.lib.versionAtLeast ocaml.version "4.02"
then throw "sedlex is not available for OCaml ${ocaml.version}"
else

stdenv.mkDerivation rec {
  name = "ocaml${ocaml.version}-sedlex-${version}";
  version = "1.99.5";

  src = fetchzip {
    url = "https://github.com/ocaml-community/sedlex/archive/fb84e1766fc4b29e79ec40029ffee5cdb37b392f.tar.gz";
    sha256 = "0phnqyn6mpv5byr1kkphl24y9q9fb2k3xg9yb457h5816q6ya72n";
  };

  buildInputs = [ ocaml findlib ppx_tools_versioned ];

  propagatedBuildInputs = [ gen ];

  buildFlags = [ "all" "opt" ];

  createFindlibDestdir = true;

  dontStrip = true;

  meta = {
    homepage = https://github.com/ocaml-community/sedlex;
    description = "An OCaml lexer generator for Unicode";
    license = stdenv.lib.licenses.mit;
    inherit (ocaml.meta) platforms;
    maintainers = [ stdenv.lib.maintainers.vbgl ];
  };
}
