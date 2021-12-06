$arr = @() 

$srvs = Get-WmiObject win32_service | Select-Object Name, ProcessId  

$prt = netstat -a -n -o | ConvertFrom-String | Select-Object p2, p3, p4, p5, p6 

foreach($i in $srvs){


foreach($j in $prt){
if($i.ProcessId -eq $j.p5)

{
write-Host ($i.Name + " " + $j.p3)
}

}
$arr += $i 

} 

Get-WmiObject win32_service | Select-Object Name, ProcessId  > C:\temp\cikti.txt
