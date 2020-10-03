url=$1
base_dir=`dirname $0`

ext=cpp
template_file=template.$ext
solve_file=solve.$ext

cd $base_dir/scraper && source venv/bin/activate
res=`python3 scrape.py $url`

if [ `echo $res | awk -F ':' '{print $1}'` == 'ERR' ]; then
    echo $res
else
    cd .. && mkdir ../$res 2> /dev/null
    if [ ! -f ../$res/$solve_file ]; then
        cp $template_file ../$res/$solve_file
        echo Created $res/$solve_file successfully!
    else
        echo Oops! File $res/$solve_file has already been created.
    fi
fi
