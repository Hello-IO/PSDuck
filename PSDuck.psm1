

Function Confirm-Has_Members{
  param([parameter(Mandatory=$true)]$InputObject,[parameter(Mandatory=$true)][System.String[]]$Members)
      
      $obj = @{} 
      $obj.MeetsRequirements = $false
             
      switch($InputObject){         
      { $_ -is [System.Collections.Hashtable]} {$this = $_ 
                                                $obj.MissingValues = $Members| %{ if( -not $this.ContainsKey($_) ) {$_}  }                                              
                                                break
                                                }           
      default  { $this = $_ 
                                $properties = $this|Get-Member|Select-Object -ExpandProperty Name
                                $obj.MissingValues = $Members| %{ if( -not $properties.Contains($_) ) {$_}  } 
                                break
                              }
      } #end switch

     
      if( $obj.MissingValues -eq $null){
         $obj.MeetsRequirements = $true
      }
    
      $obj
}  #End Assert-Has_Interface
