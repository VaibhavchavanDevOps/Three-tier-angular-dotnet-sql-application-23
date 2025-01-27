import json
import subprocess

def get_terraform_outputs():
    # Run the terraform output command and capture the output
    result = subprocess.run(['terraform', 'output', '-json'], capture_output=True, text=True)
    terraform_output = json.loads(result.stdout)
    return terraform_output['sql_instance_public_ip']['value'], terraform_output['sql_instance_name']['value']

def update_server_ip(appsettings_path, new_ip, instance_name):
    with open(appsettings_path, 'r') as f:
        appsettings = json.load(f)
    
    # Update the connection string with the new IP and other parameters
    appsettings['ConnectionStrings']['Database'] = f"Server={new_ip},1433;Database={instance_name};User Id=sqlserver;Password=vaibhavchavan"
    
    with open(appsettings_path, 'w') as f:
        json.dump(appsettings, f, indent=2)

def update_secret_yaml(secret_yaml_path, new_ip, instance_name):
    with open(secret_yaml_path, 'r') as f:
        lines = f.readlines()
    
    with open(secret_yaml_path, 'w') as f:
        for line in lines:
            if line.strip().startswith("ConnectionStrings__Database:"):
                f.write(f"  ConnectionStrings__Database: \"Server={new_ip},1433;Database={instance_name};User Id=sqlserver;Password=vaibhavchavan;\"\n")
            else:
                f.write(line)

# Paths to the configuration files
appsettings_path = '/home/vrchavan02/Three-tier-angular-dotnet-sql-application-23/ElectricEquipmentDotNetCoreAPI/appsettings.json'
secret_yaml_path = '/home/vrchavan02/Three-tier-angular-dotnet-sql-application-23/manifest/secret.yaml'

# Fetch the new IP address and instance name from the Terraform output
new_ip, instance_name = get_terraform_outputs()

# Update the server IP address and instance name in the appsettings.json file
update_server_ip(appsettings_path, new_ip, instance_name)

# Update the connection string in the secret.yaml file
update_secret_yaml(secret_yaml_path, new_ip, instance_name)

print(f"The server IP address in {appsettings_path} has been updated to {new_ip} and the database name to {instance_name}.")
print(f"The connection string in {secret_yaml_path} has been updated to use the new IP and database name.")