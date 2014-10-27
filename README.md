PSDuck is a simple Powershell module that I have created to validate if an object has required members.
This function works on hashtables too.  

Tutorial
```

#Programmer creates three objects.
$widget_A = New-Object PSObject -Property @{name='Widget A'; cost='4.50'}

$widget_B = New-Object PSObject -Property @{name='Widget B'; cost='9.99'}

#Widget C is missing a required 'cost' member that Do-Work function requires to perform work.
$widget_C = New-Object PSObject -Property @{name='Widget C'}

$widget_D = @{name='Widget D'; cost='20.00'}


Function Do-Work{
    param($Object)

        #Do-Work interface requirements to perform some work.
        $required_members = @( 'name','cost')

        #Interface will have two usuable members: MeetsRequirements and MissingValues.  
        #If the interface meets requirements, it will have no missing values list.
        $interface = Confirm-Has_Members -InputObject $Object -ExpectedMembers $required_members

        if( -not ($interface.MeetsRequirements) ){
            #throw some error or perform some other logic.
            Write-Host "$($Object.name) is missing the following properties: $($interface.MissingValues -join ',')" -ForegroundColor Green
        }

        #... Perform some work
}


Do-Work $widget_A
Do-Work $widget_B
Do-Work $widget_C
Do-Work $widget_D

```