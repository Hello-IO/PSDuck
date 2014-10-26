

Function Confirm-Has_Interface{
  param([parameter(Mandatory=$true)]$InputObject,[parameter(Mandatory=$true)][System.String[]]$Contract)
      
      $obj = @{} 
      $obj.MeetsRequirements = $false
             
      switch($InputObject){         
      { $_ -is [System.Collections.Hashtable]} {$this = $_ 
                                                $obj.MissingValues = $Contract| %{ if( -not $this.ContainsKey($_) ) {$_}  }                                              
                                                break
                                                }
      { $_ -is [PSObject]}    { $this = $_ 
                                $properties = $this|Get-Member|Select-Object -ExpandProperty Name
                                $obj.MissingValues = $Contract| %{ if( -not $properties.Contains($_) ) {$_}  } 
                                break
                              }     
      default {throw "-InputObject for 'Assert-Missing_Property function' must by an object or hashtable"}
      } #end switch

     
      if( $obj.MissingValues -eq $null){
         $obj.MeetsRequirements = $true
      }
    
      $obj
}  #End Assert-Has_Interface
