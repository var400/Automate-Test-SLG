import yaml

def load_yaml(file_path):
    with open(file_path, 'r') as file:
        return yaml.safe_load(file)

import yaml
def convert_to_yaml(data):
    return yaml.dump(data, default_flow_style=False)