{
  flake.templates = {
    flutter = {
      path = ./flutter;
      description = "Development environment for Flutter";
    };

    go = {
      path = ./go;
      description = "Development environment for Golang";
    };

    node = {
      path = ./node;
      description = "Development environment for NodeJS";
    };
  };
}
