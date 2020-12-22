function Get-Configuration
{
  <#
      .SYNOPSIS
      This file stores the orgTag that must be replaced during the deployment.
      .DESCRIPTION
      Add a more complete description of what the function does.

      .EXAMPLE
      Get-Configuration
      Describe what this call does

      .NOTES
      Place additional notes here.

      .LINK
      URLs to related sites
      The first link is opened by Get-Help -Online Get-Configuration

      .INPUTS
      List of input types that are accepted by this function.

      .OUTPUTS
      List of output types produced by this function.
  #>
    $configuration = @{`
      # Do Not change Below
      # ########################################################
      orgTag = 'ORG-TAG'
      suffix = 'pcus'
      location = 'LOCATION-NAME'
      locationDescription = 'LOCATION-DESCRIPTION'
      Approver = 'approver@company.org'
      Owner = 'owner@company.org'
      Requester = 'requester@company.org'
      BudgetAmount = '$0-Month'
      CostCenter = 'GL 867-5309'
      DR = 'Mission-Critical'
      StartDate = '01/01/2020'
      EndDate = '12/31/9999'
      Env = 'dev'
      ServiceClass = 'Gold'
    }
  return $configuration
}
