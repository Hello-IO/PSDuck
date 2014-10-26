Import-Module PSate
Import-Module PShould

$parentFolder = Split-Path -Path $PSScriptRoot -Parent
Import-Module (Join-Path -Path $parentFolder -ChildPath PSDuck.psm1)

Describing 'PSDuck.psm1'{
    TestSetup{
      $required_properties = @('Property1','Property2','Property3','Property4')
    
    }

    Given 'a PSObject with required properties'{
  
        TestSetup{
              
              $testObject = New-Object PSObject -Property @{Property1='';Property2='';Property3='';Property4=''}
              $interface = Confirm-Has_Members -InputObject $testObject -Members $required_properties
    
        }

        It 'will return true'{
          $interface.MeetsRequirements | should be $true
    
        }

        It 'will have no missing properties'{
          $interface.MissingValues.Count | should be -eq 0
          $interface.MissingValues | should be $null
        }
  
    }  #End Given

    Given 'a PSObject missing one required property'{
  
        TestSetup{
              #$required_properties = @('Property1','Property2')
              $testObject = New-Object PSObject -Property @{Property1='';Property3='';Property4=''}
              $interface = Confirm-Has_Members -InputObject $testObject -Members $required_properties
    
        }

        It 'will return false'{
          $interface.MeetsRequirements | should be $false
    
        }

        It 'will list one missing property'{
          $interface.MissingValues.Count | should be -eq 1
          $interface.MissingValues | should be 'Property2'
        }

       
  
    }  #End Given

    Given 'a hashtable with required properties'{
  
        TestSetup{             
              $testHashTable =  @{Property1='';Property2='';Property3='';Property4=''}
              $interface = Confirm-Has_Members -InputObject $testHashTable -Members $required_properties
    
        }

        It 'will return true'{
          $interface.MeetsRequirements | should be $true
    
        }

        It 'will have no missing properties'{
          $interface.MissingValues.Count | should be -eq 0
          $interface.MissingValues | should be $null
        }

    }  #End Given

    Given 'a hashtable without keys'{
  
        TestSetup{              
              $testHashTable = @{}
              $interface = Confirm-Has_Members -InputObject $testHashTable -Members $required_properties
    
        }

        It 'will return false'{
          $interface.MeetsRequirements | should be $false
    
        }

        It 'will list four missing properties'{
          $interface.MissingValues.Count | should be -eq 4
          $interface.MissingValues | should be $required_properties
        }
    }  #End Given

    Given 'a hashtable missing two required properties'{
  
        TestSetup{
              #$required_properties = @('Property1','Property2')
              $testHashTable = @{Property1='';Property4=''}
              $interface = Confirm-Has_Members -InputObject $testHashTable -Members $required_properties
    
        }

        It 'will return false'{
          $interface.MeetsRequirements | should be $false
    
        }

        It 'will list two  missing properties'{
          $interface.MissingValues.Count | should be -eq 2
          $interface.MissingValues | should be 'Property2','Property3'
    
        }
  
    }  #End Given

    Given 'a hashtable missing two required properties'{
  
        TestSetup{
              #$required_properties = @('Property1','Property2')
              $testHashTable = @{Property1='';Property4=''}
              $interface = Confirm-Has_Members -InputObject $testHashTable -Members $required_properties
    
        }

        It 'will return false'{
          $interface.MeetsRequirements | should be $false
    
        }

        It 'will list two  missing properties'{
          $interface.MissingValues.Count | should be -eq 2
          $interface.MissingValues | should be 'Property2','Property3'
    
        }
  
    }  #End Given    


}  #End Describing

Remove-Module PSDuck

