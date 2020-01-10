## Experimental deployment of sonata v5.1 in kubernetes

To install the SP, you should have a kubernetes cluster already configured and your kubectl pointing to it and also metallb.

Run the command:
```bash
./deploy-in-k8s.sh
```

After the deployment you will have the folling list of pods

```
kubectl get pods

NAME                                           READY   STATUS    RESTARTS   AGE
functionlifecyclemanagement-84997f4f8c-sbrc9   1/1     Running   0          6d6h
ia-nbi-5c7968c6b7-pgrw5                        1/1     Running   0          6d6h
influxdb-d6ccc5b44-twl64                       1/1     Running   0          6d6h
mongo-58597d47fc-hcw6l                         1/1     Running   0          6d6h
placementplugin-646d558bdc-tgqwv               1/1     Running   0          6d6h
servicelifecyclemanagement-7bd9689f86-hlh2b    1/1     Running   0          6d6h
son-broker-d6dff75f8-chtzq                     1/1     Running   0          6d6h
son-monitor-alertmanager-5c9fd7cd9b-vmbdn      1/1     Running   0          6d6h
son-monitor-grafana-5cc8795c84-s2brb           1/1     Running   0          6d6h
son-monitor-manager-c9467957-lj92g             1/1     Running   0          6d6h
son-monitor-postgres-6cc87cbc9b-hdbbb          1/1     Running   0          6d6h
son-monitor-prometheus-7877586cb6-bknpf        1/1     Running   0          6d6h
son-monitor-pushgateway-7db554889-b4rwl        1/1     Running   0          6d6h
son-monitor-snmpmng-bd95c4584-5bd6k            1/1     Running   0          6d6h
son-monitor-spprobe-6ddf78cc6b-7tsz4           1/1     Running   0          6d6h
son-postgres-64ffdc8755-49md9                  1/1     Running   1          6d6h
son-redis-549f8cc464-z5v46                     1/1     Running   0          6d6h
specificmanagerregistry-57c797f8f4-gkvsl       1/1     Running   1          6d6h
tng-api-gtw-8669b57774-mwdnn                   1/1     Running   0          6d6h
tng-cat-76f97d9d76-k5r49                       1/1     Running   0          6d6h
tng-gtk-common-6d86bbfc59-g74x4                1/1     Running   0          6d6h
tng-gtk-sp-6d8dcd99b5-8928f                    1/1     Running   0          6d6h
tng-gtk-usr-6ff59f8788-rk4dg                   1/1     Running   0          6d6h
tng-policy-mngr-7d88b449-lpknt                 1/1     Running   0          6d6h
tng-portal-84c464c8b6-zdjks                    1/1     Running   0          6d6h
tng-rep-fbcdf7986-2f2wh                        1/1     Running   0          6d6h
tng-sdk-package-c6599978d-9jd6r                1/1     Running   0          6d6h
tng-sec-gtw-56f965c744-crsz4                   1/1     Running   0          6d6h
tng-sla-mgmt-5656d5fcd5-xjg55                  1/1     Running   0          6d6h
tng-slice-mngr-6df944c5cb-l7bmg                1/1     Running   0          6d6h
tng-sp-ia-k8s-6b548d774d-5ddgm                 1/1     Running   0          6d6h
vim-wrapper-heat-66c76f8c6f-hvr9b              1/1     Running   0          6d6h
vim-wrapper-mock-595f846c85-mhrr6              1/1     Running   0          6d6h
vim-wrapper-ovs-599bf98dd5-bqlzz               1/1     Running   0          6d6h
wim-wrapper-mock-5b559d45c4-bfhdt              1/1     Running   0          6d6h
wim-wrapper-tapi-5dd9b89f9f-q76qp              1/1     Running   0          6d6h
wim-wrapper-vtn-8b9496dd-6cxzb                 1/1     Running   0          6d6h
```

The following list of services:

```
kubectl get svc
NAME                      TYPE           CLUSTER-IP       EXTERNAL-IP    PORT(S)                         AGE
broker                    ClusterIP      10.101.246.30    <none>         4369/TCP,5672/TCP,15672/TCP     6d6h
ia-nbi                    ClusterIP      10.110.179.60    <none>         8083/TCP                        6d6h
influxdb                  ClusterIP      10.96.252.209    <none>         8086/TCP                        6d6h
kubernetes                ClusterIP      10.96.0.1        <none>         443/TCP                         6d6h
mongo                     ClusterIP      10.106.175.48    <none>         27017/TCP                       6d6h
pluginmanager             ClusterIP      10.106.135.227   <none>         8001/TCP                        6d6h
postgsql                  ClusterIP      10.98.189.241    <none>         5432/TCP                        6d6h
prometheus                ClusterIP      10.96.44.207     <none>         9090/TCP,9089/TCP               6d6h
son-broker                ClusterIP      10.105.192.17    <none>         5672/TCP,15672/TCP,4369/TCP     6d6h
son-mongo                 ClusterIP      10.101.48.189    <none>         27017/TCP                       6d6h
son-monitor-grafana       ClusterIP      10.101.16.24     <none>         3000/TCP                        6d6h
son-monitor-influxdb      ClusterIP      10.104.196.103   <none>         8086/TCP                        6d6h
son-monitor-manager       LoadBalancer   10.109.41.211    10.121.0.151   8000:30693/TCP,8888:30866/TCP   6d6h
son-monitor-postgres      ClusterIP      10.96.232.191    <none>         5433/TCP                        6d6h
son-monitor-prometheus    LoadBalancer   10.105.106.234   10.121.0.152   9090:31025/TCP,9089:31670/TCP   6d6h
son-monitor-pushgateway   ClusterIP      10.107.25.43     <none>         9091/TCP                        6d6h
son-postgres              ClusterIP      10.108.149.192   <none>         5432/TCP                        6d6h
son-redis                 ClusterIP      10.108.135.68    <none>         6379/TCP                        6d6h
tng-api-gtw               ClusterIP      10.109.14.52     <none>         5000/TCP                        6d6h
tng-api-gtw-external      LoadBalancer   10.100.217.138   10.121.0.150   32002:31347/TCP                 6d6h
tng-cat                   ClusterIP      10.111.163.209   <none>         4011/TCP                        6d6h
tng-gtk-common            ClusterIP      10.100.217.160   <none>         5000/TCP                        6d6h
tng-gtk-sp                ClusterIP      10.102.119.2     <none>         5000/TCP                        6d6h
tng-gtk-usr               ClusterIP      10.104.3.39      <none>         4567/TCP                        6d6h
tng-policy-mngr           ClusterIP      10.111.125.154   <none>         8081/TCP                        6d6h
tng-portal                ClusterIP      10.97.49.66      <none>         4200/TCP                        6d6h
tng-rep                   ClusterIP      10.103.107.8     <none>         4012/TCP                        6d6h
tng-sdk-package           ClusterIP      10.102.175.84    <none>         5099/TCP                        6d6h
tng-sec-gtw               LoadBalancer   10.108.230.135   10.121.0.153   80:30944/TCP,443:32632/TCP      6d6h
tng-sla-mgmt              ClusterIP      10.107.168.46    <none>         8080/TCP                        6d6h
tng-slice-mngr            ClusterIP      10.103.195.150   <none>         5998/TCP                        6d6h

```

To open the Portal just check the IP of the load balancer given by metallb with the command:
```
kubectl get svc -o wide | grep tng-sec-gtw | awk '{print $4}'
```
