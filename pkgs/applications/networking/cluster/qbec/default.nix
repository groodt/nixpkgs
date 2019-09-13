{ lib, buildGoModule, fetchFromGitHub, ... }:

let version = "0.7.5"; in

buildGoModule {
  pname = "qbec";
  inherit version;

  src = fetchFromGitHub {
    owner = "splunk";
    repo = "qbec";
    rev = "v${version}";
    sha256 = "1q3rbxih4fn0zv8dni5dxb3pq840spplfy08x941najqfgflv9gb";
  };

  modSha256 = "0s1brqvzm1ghhqb46aqfj0lpnaq76rav0hwwb82ccw8h7052y4jn";

  meta = {
    description = "Configure kubernetes objects on multiple clusters using jsonnet https://qbec.io";
    homepage = https://github.com/splunk/qbec;
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ groodt ];
    platforms = lib.platforms.unix;
  };
}
