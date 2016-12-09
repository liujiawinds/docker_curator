# docker_curator
Curator is a elasticsearch index management tool. This repo to be created for deleting index automatically after a duration.


## How to use
```
chmod +x run.sh
docker build -t maxent/curator:4.2.1 ./
```

## in kubernetes 

After the image generated, I put it onto my private registry. So I can use this in my kubernetes rc like below.

You should pay attention to the environment variable `ELASTICSEARCH_HOST`, the value based on SkyDNS.

If you did not have SkyDNS configured, you can hard code it. eg. `127.0.0.1`

```
apiVersion: v1
kind: ReplicationController
metadata:
  name: curator
  namespace: kube-system
  labels:
    k8s-app: curator
    version: v1
spec:
  replicas: 1
  selector:
    k8s-app: curator
    version: v1
  template:
    metadata:
      labels:
        k8s-app: curator
        version: v1
    spec:
      containers:
      - image: maxcd03-kube1.chinacloudapp.cn/maxent/curator:4.2.1
        name: curator
        env:
        - name: ELASTICSEARCH_HOST
          value: elasticsearch-logging
        - name: DELETE_INDEX_DAYS_OLDER_THAN
          value: "7"
        - name: INTERVAL_IN_HOURS
          value: "24"
```
