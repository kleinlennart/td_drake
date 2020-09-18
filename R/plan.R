the_plan <- drake_plan(
    
    # loading data
    
    d = readRDS(file_in("data/data-final-2020-09-17.rds")),
    

    # for site
    
    dependencies = rmarkdown::render(
      knitr_in("dependencies.Rmd"),
      output_file = file_out("public/dependencies.html")
    ),
    
    rendered_site = render_site() 
)
