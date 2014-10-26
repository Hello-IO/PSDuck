

Function Confirm-Has_Members{
  param([parameter(Mandatory=$true)]$InputObject,[parameter(Mandatory=$true)][System.String[]]$ExpectedMembers)
      
      $obj = @{} 
      $obj.MeetsRequirements = $false
      $actualMembers      
      switch($InputObject){         
      { $_ -is [System.Collections.Hashtable]} { #Collect hashtable object members including keys.
                                                 $actualMembers = ($_|Get-Member|Select-Object -ExpandProperty Name) + ($_|Select-Object -ExpandProperty Keys)                                           
                                                 break
                                                }           
      default  { #Collect object members.
                 $actualMembers = $_|Get-Member|Select-Object -ExpandProperty Name
                 break
                }
      } #end switch

      $obj.MissingValues = $ExpectedMembers| %{ if( -not $actualMembers.Contains($_) ) {$_}  }
     
      if( $obj.MissingValues -eq $null){
         $obj.MeetsRequirements = $true
      }
    
      $obj
}  #End Assert-Has_Interface
