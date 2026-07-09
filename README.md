# eurydice.github.io

Hi, this is my personal website.

## How to add and edit pages

1. Create your page as a .md Markdown document

2. Run `bash convert_to_html.sh` and it will automatically convert all Markdown files to html files. (You will need `pandoc` installed.)

3. Deploy to GitHub pages

## Editing the site layout and style

This site uses [Sakura.css](https://github.com/oxalorg/sakura) and [glightbox](https://github.com/biati-digital/glightbox/tree/master). The `convert_to_html.sh` script uses the `template.html` file as a template, which contains some additional CSS customizations and tweaks.
