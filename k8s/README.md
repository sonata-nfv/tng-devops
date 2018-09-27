## Experimental deployment of sonata v4.0 in kubernetes

To install the SP, you should have a kubernetes cluster already configured and your kubectl pointing to it.

Run the command:
```bash
./deploy-in-k8s.sh
```

After the deployment you will have the folling list of pods

```
kubectl get pods

NAME                                           READY     STATUS    RESTARTS   AGE
broker-57856d968f-p4hld                        1/1       Running   0          17m
functionlifecyclemanagement-7f976c579b-zrlc8   1/1       Running   0          43m
influxdb-657957856d-8svk9                      1/1       Running   0          51m
mongo-85bf558ff9-bdswv                         1/1       Running   0          51m
placementexecutive-5d8565ddbb-fpl6r            1/1       Running   0          43m
placementplugin-789cb69785-v5k4v               1/1       Running   0          43m
pluginmanager-6c5bf594f8-9kbnx                 1/1       Running   0          43m
servicelifecyclemanagement-5954c9d846-b7ffl    1/1       Running   0          42m
son-monitor-manager-568f96cdd4-6d2nc           1/1       Running   0          34m
son-monitor-postgres-7c9c64cd6-sswks           1/1       Running   0          51m
son-monitor-prometheus-f8d466767-ns9hc         1/1       Running   0          43m
son-monitor-pushgateway-54848b5478-qbbhx       1/1       Running   0          29m
son-monitor-snmpmng-777c6b7bc9-5bppg           1/1       Running   0          43m
son-postgres-596cc46b48-2t84b                  1/1       Running   0          51m
son-sp-infrabstract-7ff5f9655c-2l6qj           1/1       Running   0          43m
specificmanagerregistry-64f5446598-hgnhw       1/1       Running   1          17m
tng-api-gtw-7b69679d5c-bgkzb                   1/1       Running   0          49m
tng-cat-7f6559968f-n2cqr                       1/1       Running   0          37m
tng-gtk-common-767b79d7d4-htqhg                1/1       Running   0          49m
tng-gtk-sp-7974c5ffd5-rcz5w                    1/1       Running   0          49m
tng-policy-mngr-9d79497b5-85gps                1/1       Running   0          43m
tng-portal-7d68d49845-glhpm                    1/1       Running   0          43m
tng-rep-fd94b5945-jsfgh                        1/1       Running   0          43m
tng-sdk-package-7854fdfdff-8q9qc               1/1       Running   0          29m
tng-sec-gtw-7759d44bbc-nxhkr                   1/1       Running   0          43m
tng-sla-mgmt-d574df768-zhw7x                   1/1       Running   0          43m
tng-slice-mngr-6886fc6fc5-prws5                1/1       Running   0          43m
wim-adaptor-67544f66bd-vxqhr                   1/1       Running   0          43m
```

The following list of services:

```
kubectl get svc

NAME                      TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)                          AGE
broker                    NodePort    10.107.144.22    <none>        5672:32171/TCP,15672:30430/TCP   52m
influxdb                  NodePort    10.105.19.172    <none>        8086:31269/TCP                   52m
kubernetes                ClusterIP   10.96.0.1        <none>        443/TCP                          4d
mongo                     NodePort    10.101.16.113    <none>        27017:30995/TCP                  52m
pluginmanager             ClusterIP   10.104.93.95     <none>        8001/TCP                         45m
postgsql                  ClusterIP   10.98.214.210    <none>        5432/TCP                         52m
son-broker                NodePort    10.111.230.6     <none>        5672:31181/TCP,15672:32062/TCP   21m
son-mongo                 NodePort    10.100.128.73    <none>        27017:30596/TCP                  52m
son-monitor-influxdb      NodePort    10.101.233.81    <none>        8086:32116/TCP                   52m
son-monitor-manager       NodePort    10.110.249.175   <none>        8000:32516/TCP,8888:31957/TCP    35m
son-monitor-postgres      ClusterIP   10.109.5.110     <none>        5432/TCP                         52m
son-monitor-prometheus    ClusterIP   10.102.14.91     <none>        9090/TCP,9089/TCP,8002/TCP       45m
son-monitor-pushgateway   ClusterIP   10.103.161.135   <none>        9091/TCP                         45m
son-postgres              ClusterIP   10.103.1.101     <none>        5432/TCP                         52m
task-pv-pod               ClusterIP   10.106.129.105   <none>        80/TCP                           3d
tng-api-gtw               ClusterIP   10.109.37.76     <none>        5000/TCP                         50m
tng-cat                   ClusterIP   10.101.206.201   <none>        4011/TCP                         45m
tng-gtk-common            ClusterIP   10.100.78.207    <none>        5000/TCP                         50m
tng-gtk-sp                ClusterIP   10.101.153.85    <none>        5000/TCP                         50m
tng-policy-mngr           ClusterIP   10.97.85.83      <none>        8081/TCP                         45m
tng-portal                NodePort    10.103.138.252   <none>        4200:32010/TCP                   45m
tng-rep                   ClusterIP   10.103.62.36     <none>        4012/TCP                         45m
tng-sdk-package           ClusterIP   10.106.98.49     <none>        5099/TCP                         30m
tng-sec-gtw               NodePort    10.98.239.114    <none>        80:30985/TCP,443:30425/TCP       45m
tng-sla-mgmt              ClusterIP   10.109.233.188   <none>        8080/TCP                         45m
tng-slice-mngr            ClusterIP   10.103.217.215   <none>        5998/TCP                         45m
```

For now until we develop the ingress controller for the SP, you can use the port exported by nodeport in the tng-sec-gtw container:

1. Search in which node was deployed the tng-sec-gtw:
kubectl get po -o wide | grep tng-sec-gtw | awk {'print $7'}

2. Get the PORT exposed in the node
kubef get svc | grep tng-portal | tr ":" "\t" | awk '{print $6}'

3. Use the IP of the node and the port obtained in point 2, to open the tng-portal
