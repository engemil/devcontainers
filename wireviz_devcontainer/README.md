# WireViz Development Container

This devcontainer is for generating cable(s), wiring harnesse(s) and connector pinout documents (code-to-image) with WireViz: https://github.com/wireviz/WireViz

Added VS Code extensions:
- **RunOnSave** - To autogenerate wireviz files each time you save a .yml file.
    - NB! If you modify and save `docker-compose.yml` file or any other .yml file that is not meant for WireViz. Will still generate WireViz files.
- **graphviz-interactive-preview** - To preview .gv files.
    - Preview automatically comes up when you open .gv files.



## How to use it:

- Make a .yml-file inside the `build`-folder.
- Write WireViz syntax (https://github.com/wireviz/WireViz/blob/master/docs/syntax.md)
- Open `build`-folder in terminal: `cd build`
- Generate the files with: `wireviz <filename>.yml` (e.g. `wireviz my_cable.yml`)
- Save the .yml-file and it will auto-generate all the WireViz files.
- To see your result open the .png file or the .gv file for previews.
    - You might need to refresh the file explorer in VSCode to see the generated files.
- Now you can for example click on the .png-file to view the result.


## Useful links

- Syntax: https://github.com/wireviz/WireViz/blob/master/docs/syntax.md
- Tutorial: https://github.com/wireviz/WireViz/blob/master/tutorial/readme.md
- Examples: https://github.com/wireviz/WireViz/tree/master/examples
