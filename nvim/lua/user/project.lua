require "neoproj".setup {
  -- Directory which contains all of your projects
  project_path = "~/src",
}
require "neoproj".register_template {
  name = "Empty project (Git)",
  expand = "git init",
}
