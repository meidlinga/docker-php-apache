echo Booted container
echo docroot $WEB_DOCUMENT_ROOT
ls $WEB_DOCUMENT_ROOT
printenv

echo "Starting SSH ..."
service ssh start

