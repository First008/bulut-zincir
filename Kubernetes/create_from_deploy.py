from kubernetes import client, config, utils

def deploy():

    config.load_kube_config()

    k8s_client = client.ApiClient()
    yaml_file = 'geth.yaml'

    utils.create_from_yaml(k8s_client, yaml_file)
