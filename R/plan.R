the_plan <- drake_plan(
  
    # create subpages

    aggregate_data = rmarkdown::render(
      knitr_in("aggregate_data.Rmd"),
      output_file = file_out("docs/aggregate_data.html")
    ),
    
    # loading data, most recent version
    
    d_raw = readRDS(file_in("./data/raw_merged.rds")),
    
    create_variables = rmarkdown::render(
      knitr_in("create_variables.Rmd"),
      output_file = file_out("docs/create_variables.html"),
      params = list(d = d_raw)
    ),

    # loading cleaned data, most recent version
    
    d = readRDS(file_in("./data/clean_final.rds")),
    
    descriptives = rmarkdown::render(
      knitr_in("descriptives.Rmd"),
      output_file = file_out("docs/descriptives.html"),
      params = list(d = d)
    ),
    
    analysis = rmarkdown::render(
      knitr_in("analysis.Rmd"),
      output_file = file_out("docs/analysis.html"),
      params = list(d = d)
    ),    

    dependencies = rmarkdown::render(
      knitr_in("dependencies.Rmd"),
      output_file = file_out("docs/dependencies.html")
    ),
    
    # render site, optionally do manually
    
    rendered_site = render_site() 
)
