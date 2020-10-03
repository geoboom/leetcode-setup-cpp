url=$1
base_dir=`dirname $0`

ext=cpp
template_file=template.$ext
solve_file=solve.$ext

cd $base_dir/scraper && source venv/bin/activate && cd ..

# if no template file
if [ ! -f $template_file ]; then
    echo "Oops! Template file $template_file does not exist. Exiting..."
    exit 1
fi 

res=`python3 ./scraper/scrape.py $url`

# terminate if error encountered in running the python script
if [ `echo $res | awk -F ':' '{print $1}'` == 'ERR' ]; then
    echo $res
    echo Exiting...
    exit 1
fi

# if solve file already exists
if [ -f ../$res/$solve_file ]; then
    echo "Oops! File $res/$solve_file already exists. Exiting..."
    exit 1
fi

# make the leetcode problem folder and copy the template file over
mkdir ../$res 2> /dev/null 
cp $template_file ../$res/$solve_file

echo "Created $res/$solve_file successfully!"
