## Load your R files
lapply(list.files("./R", full.names = TRUE), source)

## UpdateProject
drake_config(the_plan, lock_envir = FALSE)
make(the_plan)

## Create Workflow Graph and move files to /public
vis_drake_graph(the_plan, file = "graph.html")
fs::file_move("graph.html", "public/graph.html")
fs::dir_delete("public/graph_files")
fs::file_move("graph_files", "public/graph_files")