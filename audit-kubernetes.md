## Create an Audit Policy:  [BY OBA]
### Define an audit policy that specifies what events to log. Here’s an example policy that logs all DELETE actions:

```bash
apiVersion: audit.k8s.io/v1
kind: Policy
rules:
- level: RequestResponse
  verbs: ["delete"]
  resources:
  - group: ""
    resources: ["namespaces"]
```

## Update the API Server Configuration:
### Modify the Kubernetes API server configuration to enable audit logging. You typically do this in the kube-apiserver manifest file.

```bash
--audit-policy-file=/etc/kubernetes/audit-policy.yaml
--audit-log-path=/var/log/kubernetes/audit.log
--audit-log-maxage=30
--audit-log-maxsize=100
--audit-log-maxbackup=5
```

- Ensure that the audit-policy.yaml file is in the specified path.
Deploy the Configuration:
If you are using a managed Kubernetes service (like GKE, EKS, or AKS), you might need to follow specific guidelines provided by your provider to enable audit logging. For self-hosted clusters, restart the API server to apply the changes.
Accessing the Audit Logs:
After enabling audit logging, you can view the logs at the specified log path (e.g., /var/log/kubernetes/audit.log). You can parse these logs to find DELETE actions on namespaces.

## Example of Parsing Logs
### To find specific DELETE actions, you can use grep:

```bash
grep 'DELETE' /var/log/kubernetes/audit.log | grep 'namespaces'
```

Monitoring and Alerting
Consider setting up monitoring and alerting on your audit logs using tools like:

Fluentd or Logstash for log aggregation and parsing.
Elasticsearch and Kibana for visualization and querying logs.
Prometheus and Grafana for monitoring alerts.
