## Force namespace to be deleted : 
### start with the following command :

```bash
kubectl get namespace velero -o json > velero.json
# Find the line which contain ""finalizers": []" ==> Make sure you emty the field like that <==
#Now apply that file to delete the finilized namespace :
kubectl replace --raw "/api/v1/namespaces/velero/finalize" -f ./velero.json
```
