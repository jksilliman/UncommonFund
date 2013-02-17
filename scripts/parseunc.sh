#parsunc.sh
#!/bin/bash

for i in {1..100}
do
    wget http://uncommonfund.uchicago.edu/projects/"$i" -O test -q
    ./parseunc.py test
done
