## Snakefile - pp4rs final project
##
## @jlehtomaa ##

LOG_ALL = "2>&1"

# --- Import a config file --- #
configfile: "config.yaml"

# --- Iterable lists --- #
TABLES  = glob_wildcards(config["src_tables"] + "{iTable}.R").iTable
FIGURES = glob_wildcards(config["src_figures"] + "{iFigure}.R").iFigure
print(FIGURES)

# --- Build rules --- #

rule all:
    input:
        tables = expand(config["out_tables"] + "{iTable}.tex",
                    iTable = TABLES),
        figures = expand(config["out_figures"] + "{iFigure}.png",
                    iFigure = FIGURES),
        paper = config["out_paper"] + "final_paper.pdf"


rule compile_paper:
    input:
        manuscript = config["src_paper"] + "final_paper.md",
        references = config["src_paper"] + "bibliography.bib"
    output:
        config["out_paper"] + "final_paper.pdf"
    log:
        config["log"] + "final_paper.log"
    shell:
        "pandoc {input.manuscript} --smart \
            --latex-engine=xelatex -o {output} \
            --bibliography {input.references} > {log} {LOG_ALL}"


# rule make_tables:
#     input:
#         script = config["src_tables"] + "{iTable}.R",
#         data = config[]
#     output:
#     log:
#     shell:




rule results_table:
    input:
        script = config["src_tables"] + "model_results.R",
        data = config["out_analysis"] + "regression_output.rds"
    output:
        tex = config["out_tables"] + "model_results.tex"
    log:
        config["log"] + "model_results.Rout"
    shell:
        "Rscript {input.script} \
            --data {input.data} \
            --out {output.tex}"

rule summary_stat_table:
    input:
        script = config["src_tables"] + "summary_stat.R",
        data = config["out_data"] + "data_complete.csv",
    output:
        tex = config["out_tables"] + "summary_stat.tex"
    log:
        config["log"] + "summary_stat.Rout"
    shell:
        "Rscript {input.script} \
            --data {input.data} \
            --out {output.tex}"

rule make_figures:
    input:
        script = config["src_figures"] + "fig_01.R",
        data = config["out_data"] + "data_complete.csv"
    output:
        fig = config["out_figures"] + "fig_01.png"
    log:
        config["log"] + "fig_01.Rout"
    shell:
        "Rscript {input.script} \
            --data {input.data} \
            --out {output.fig} > {log} {LOG_ALL}"

rule linear_model:
    input:
        script = config["src_analysis"] + "linear_regression.R",
        data = config["out_data"] + "data_complete.csv"
    output:
        data = config["out_analysis"] + "regression_output.rds"
    log:
        config["log"] + "linear_regression.Rout"
    shell:
        "Rscript {input.script} \
            --data {input.data} \
            --out {output.data} > {log} {LOG_ALL}"

rule make_vars:
    input:
        script = config["src_data_mgt"] + "gen_reg_vars.R",
        data = config["out_data"] + "rawdata_renamed.csv",
        metadata = config["src_data"] + "continent_codes.csv",
    output:
        data = config["out_data"] + "data_complete.csv"
    log:
        config["log"] + "gen_reg_vars.Rout"
    shell:
        "Rscript {input.script} \
            --data {input.data} \
            --metadata {input.metadata} \
            --out {output.data} > {log} {LOG_ALL}"

rule rename_vars:
    input:
        script = config["src_data_mgt"] + "rename_variables.R",
        data = config["src_data"] + "raw_data.csv",
    output:
        data = config["out_data"] + "rawdata_renamed.csv",
    log:
        config["log"] + "rename_variables.Rout",
    shell:
        "Rscript {input.script} \
            --data {input.data} \
            --out {output.data} > {log} {LOG_ALL}"
