## Az-func-uat-shutdown

# Setup
1. Create or use an existing Azure Automation Account.
2. Import the necessary modules (e.g., Az).
3. Create a new runbook, modify `shutdown.sh` to ensure that correct tags and RG are selected. 
4. Assign a managed identity to the Automation Account and grant it the Virtual Machine Contributor role on the testing-uat-rg resource group.
5. Schedule the runbook to execute at specified time..
