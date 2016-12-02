#!/bin/sh
#export PATH="${jenkins_tools_repo}"/jenkins/gitflow:$PATH

if [ -z "${TAG_NAME}" ] ; then
	printf "\n*** TAG_NAME is blank. BRANCH WILL BE CREATED BASED ON THE LATEST OF MASTER****\n"
fi 

git pull origin master
git checkout master

#checking if the last command was executed successfully = branch created successfully
if [ $? -eq 0 ] ; then
	#git tag -a "${BRANCH_TYPE}/${BRANCH_NAME}" -m "Tag Created for ${BRANCH_TYPE}/${BRANCH_NAME}"
	git add .
	git commit -m "CREATING $BRANCH_TYPE: ${BRANCH_NAME} - WITH CONFIGURATION" || echo 'Commit failed. There is probably nothing to commit.'
	git push -u "${REPO}" "${BRANCH_TYPE}/${BRANCH_NAME}"
	#cd $WORKSPACE
	echo "done"
else
	printf "\n***HOTFIX BRANCH CREATION FAILED****\n"
	git remote prune origin
fi


