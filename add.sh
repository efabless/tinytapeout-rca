# setup
cd tinytapeout-rca/
. ../tinytapeout-03/venv/bin/activate
. ../tinytapeout-03/setuptokens.sh 

# add the new design
./tt/configure.py --add-extra https://github.com/fiumad/RCA-Traffic-Light

# following prebuild.sh
make uncompress
./tt/configure.py --update-order --clone --fetch-gds
./tt/configure.py --update-caravel
make user_project_wrapper 

# following post_build.sh 
make compress
./tt/configure.py --update-image
./tt/tt_annotate.py
./tt/configure.py --dump-markdown datasheet.md --dump-pdf datasheet.pdf
git add spef/ gds/ lef/ verilog/gl/ verilog/rtl/
git add -u .
git commit -m 'add final RCA design'
git push
