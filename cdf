#!/bin/bash

#  This file is part of Datatools.
#  
#  Datatools is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#  
#  Datatools is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with Datatools.  If not, see <http://www.gnu.org/licenses/>.

usage(){
    name=`basename $0`
    echo -e "Usage: $name "
    echo -e ""
    echo -e "Compute the empirical cumulative distribution function of date received"
    echo -e "  from STDIN."
    echo -e "Example:"
    echo -e "  cat vals.txt | $name | plot -c \"set xlabel 'x'; set ylabel 'Pr(X<x)';\""
	exit 1
}

while [ "$1" != "" ]; do
    case $1 in
        -h | --help ) usage;;
    esac
    shift
done

cat /dev/stdin | sort -g > /tmp/fileCCDF.tmp
N=`cat /tmp/fileCCDF.tmp | wc -l`
cat /tmp/fileCCDF.tmp  | awk "{print \$1, 1.0*NR/$N}"

rm -f /tmp/fileCCDF.tmp


