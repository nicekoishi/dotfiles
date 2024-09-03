{
  flake.templates = {
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
