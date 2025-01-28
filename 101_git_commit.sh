#/bin/bash

COMMIT_MSG=`date "+%Y%m%d-%H%M%S"`

echo ${COMMIT_MSG}

git add .
git commit -m ${COMMIT_MSG}




