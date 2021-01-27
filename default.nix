with import <nixpkgs> {};
let
  unstable = import <nixos-unstable> {};
in {
  sdlEnv = stdenv.mkDerivation {
    name = "ggj";
    shellHook = ''
      env TMUX="" godot --editor&
    '';
    buildInputs =
      [ unstable.godot blender ];
  };
}



