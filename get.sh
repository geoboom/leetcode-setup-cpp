url=$1
base_dir=`dirname $0`

cd $base_dir/scraper && source venv/bin/activate
res=`python3 scrape.py $url`

if [ `echo $res | awk -F ':' '{print $1}'` == 'ERR' ]; then
    echo $res
else
    cd .. && mkdir ../$res 2> /dev/null
    if [ ! -f ../$res/solve.cpp ]; then
        cp template.cpp ../$res/solve.cpp 
        echo Created $res/solve.cpp successfully!
    else
        echo Oops! File $res/solve.cpp has already been created.
    fi
fi
