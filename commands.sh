oc process -f build.yaml --param-file=build.env  | oc apply -f-
oc start-build myspring --wait --follow --from-dir='deployments'
oc create cm myspring-config --from-file=deploy.env
oc create secret generic myspring-secret --from-file=deploy.env
oc process -f deploy.yaml --param-file=deploy.env | oc apply -f-
oc delete dc -l app=myspring,version!=1-0-2
