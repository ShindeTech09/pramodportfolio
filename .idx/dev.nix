# To learn more about how to use Nix to configure your environment
# see: https://firebase.google.com/docs/studio/customize-workspace
{ pkgs, ... }: {
  # Which nixpkgs channel to use.
  channel = "stable-24.05"; # or "unstable"

  # Use https://search.nixos.org/packages to find packages
  packages = [
    pkgs.flutter
    pkgs.android-tools # For Android development
    pkgs.cocoapods # For iOS development
    # pkgs.nodejs_20
    # pkgs.nodePackages.nodemon
  ];

  # Sets environment variables in the workspace
  env = {
    # Set FLUTTER_ROOT to the installed Flutter SDK path
    # The actual path might vary depending on the Nix installation,
    # but Nix usually links the package to a predictable path.
  };
  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      # "vscodevim.vim"
    ];

    # Enable previews
    previews = {
      enable = true;
      previews = {
        # web = {
        #   # Example: run "npm run dev" with PORT set to IDX's defined port for previews,
        #   # and show it in IDX's web preview panel
        #   command = ["npm" "run" "dev"];
        #   manager = "web";
        #   env = {
        #     # Environment variables to set for your server
        #     PORT = "$PORT";
        #   };
        # };
      };
    };

    # Workspace lifecycle hooks
    workspace = {
      # Runs when a workspace is first created
      # Ensure Flutter dependencies are fetched
      onCreate = {
        "flutter-pub-get" = "flutter pub get";
      };
      # Runs when the workspace is (re)started
      # Start the Flutter development server
      onStart = {
        "flutter-run" = "flutter run -d web --web-hostname 0.0.0.0 --web-port $PORT"; # Or choose your preferred device/platform
      };
    };
  };
}