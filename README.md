PSDuck is a simple Powershell module that I have created to facilitate duck typing for needed occasions.  

Tutorial
```
#required property the object is to have.
$required_member = 'myExtensionProperty'

#test candidate
$testString = "hello"

#confirm if $testString has the 'myExtensionProperty' member.
$interface = Confirm-Has_Members -InputObject $testString  -Members $required_member


Write-Host "TestString meets requirements: $($interface.MeetsRequirements)" -ForegroundColor DarkYellow
Write-Host "TestString's missing values are $($interface.MissingValues)" -ForegroundColor DarkYellow

#add the required member.
$testString = $testString | Add-Member -MemberType NoteProperty -Name 'myExtensionProperty' -Value 'world' -PassThru 

#confirm if $testString has the 'myExtensionProperty' member.
$interface = Confirm-Has_Members -InputObject $testString  -Members $required_member
Write-Host "TestString meets requirements: $($interface.MeetsRequirements)" -ForegroundColor DarkYellow
Write-Host "TestString's missing values are $($interface.MissingValues)" -ForegroundColor DarkYellow

```