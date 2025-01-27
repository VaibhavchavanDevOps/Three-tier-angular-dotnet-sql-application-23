import json
import subprocess

def get_backend_service_ip():
    # Run the kubectl get svc command and capture the output
    result = subprocess.run(['kubectl', 'get', 'svc', 'backend-service', '-o', 'json'], capture_output=True, text=True)
    svc_output = json.loads(result.stdout)
    return svc_output['status']['loadBalancer']['ingress'][0]['ip']

def update_environment_file(environment_path, backend_ip):
    with open(environment_path, 'r') as f:
        lines = f.readlines()
    
    with open(environment_path, 'w') as f:
        for line in lines:
            if line.strip().startswith("baseServerUrl:"):
                f.write(f"  baseServerUrl: 'http://{backend_ip}:81'\n")
            else:
                f.write(line)

# Path to the environment.prod.ts file
environment_path = '/home/vrchavan02/Three-tier-angular-dotnet-sql-application-23/ElectronicEquipmentAngular/src/environments/environment.prod.ts'

# Fetch the backend service IP from the kubectl command
backend_ip = get_backend_service_ip()

# Update the backend service IP in the environment.prod.ts file
update_environment_file(environment_path, backend_ip)

print(f"The backend service IP address in {environment_path} has been updated to {backend_ip}.")