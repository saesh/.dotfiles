function make-pdf -a INPUT -d "generate PDF from Markdown file"
    set --local pathToMarkdown (realpath $INPUT)

    if not test -d $HOME/Development/letter-boilerplate
        echo "missing letter-boilerplate project"
        exit
    end

    set --local templatePath $HOME/Development/letter-boilerplate/template.tex

    pandoc $INPUT -o (basename -- $INPUT .md).pdf --template=$templatePath --pdf-engine=xelatex
end
