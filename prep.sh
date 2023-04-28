# setup new repo
git clone https://github.com/efabless/caravel_user_project tinytapeout_rca
cd tinytapeout_rca/

# copy tt03 files
cp -r ../tinytapeout-03/tt .
cp -r ../tinytapeout-03/config.yaml .
cp -r ../tinytapeout-03/verilog/rtl/scanchain/ verilog/rtl/
cp -r ../tinytapeout-03/verilog/rtl/scan_controller/ verilog/rtl/
cp -r ../tinytapeout-03/openlane/scan_controller/ openlane/
cp -r ../tinytapeout-03/openlane/scanchain/ openlane/
cp -r ../tinytapeout-03/pre_build.sh .
cp -r ../tinytapeout-03/post_build.sh 
cp -r ../tinytapeout-03/setuptokens.sh .
cp -r ../tinytapeout-03/verilog/dv/* verilog/dv/
cp -r ../tinytapeout-03/.github/workflows/* .github/workflows/
cp -r ../tinytapeout-03/pics/ 
cp ../tinytapeout-03/gds/scanchain.gds.gz gds
cp ../tinytapeout-03/gds/scan_controller.gds.gz gds 
cp ../tinytapeout-03/lef/scan_controller.lef lef/
cp ../tinytapeout-03/lef/scanchain.lef lef/
cp ../tinytapeout-03/def/scan_controller.def def/
cp ../tinytapeout-03/verilog/gl/scan* verilog/gl/
cp ../tinytapeout-03/extra_projects.yaml .
cp ../tinytapeout-03/spef/scanchain.spef spef/
cp ../tinytapeout-03/spef/scan_controller.spef spef/
cp ../tinytapeout-03/openlane/user_project_wrapper/pdn_cfg.tcl openlane/user_project_wrapper/
cp ../tinytapeout-03/sta_top/ -r .
cp ../tinytapeout-03/stadocker.sh .
cp ../tinytapeout-03/.gitignore  .

# remove unwanted files
git rm -r verilog/dv/la_test1
git rm -r verilog/dv/la_test2
git rm -r verilog/dv/io_ports/
git rm -r verilog/dv/mprj_stimulus/
git rm -r verilog/dv/wb_port/
git rm .github/workflows/user_project_ci.yml 
git rm -r openlane/user_proj_example/
git rm verilog/rtl/user_proj_example.v 
git rm gds/*
find . -name 'user_proj_example*' | xargs git rm -r

# I put all the repos in a textfile called 'extra'
# add them all
cat extra | while read a; do ./tt/configure.py --add-extra $a ;done

# prepare to harden
make uncompress
./tt/configure.py --update-orders --clone-all --fetch-gds 
./tt/configure.py --update-caravel

# harden
make user_project_wrapper 

# compress gds and build images, pdf
make compress
./tt/configure.py --update-image
/tt/tt_annotate.py
./tt/tt_annotate.py
./tt/configure.py --dump-markdown datasheet.md --dump-pdf datasheet.pdf

# git add everything
git add spef/ gds/ lef/ verilog/gl/ verilog/rtl/
git add def/scan_controller.def  openlane/scan_controller/config.tcl 
git add openlane/scan_controller/base.sdc 
git add openlane/user_project_wrapper/pdn_cfg.tcl
git add openlane/scanchain/config.tcl openlane/scanchain/base.sdc 
git add pics/ extra_projects.yaml projects.yaml config.yaml
git add pre_build.sh post_build.sh sta_top/ projects.yaml  stadocker.sh 
git add verilog/blackbox_project_includes.v 
git add verilog/dv/scan_controller/ verilog/dv/scan_controller_ext/ verilog/dv/scan_controller_int/ verilog/dv/scan_controller_la/
git add .github/
git add datasheet.pdf 
git add openlane/scanchain/pin_order.cfg
git add -u .

# commit
git commit -m 'add all RCA designs'
