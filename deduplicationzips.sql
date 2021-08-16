Select
x._CustomerKey, 
x._CompanyKey,
x.CustomerFirstName, 
x.CustomerLastName, 
x.Email, 
x.CellPhone, 
x.Address, 
x.Address_second_line,
x.City, 
x.State, 
x.Zip,
x.RowNum
From (
    Select 
    sm._CustomerKey, 
    sm._CompanyKey,
    cm.CustomerFirstName, 
    cm.CustomerLastName, 
    cm.Email, 
    cm.CellPhone, 
    cm.Address, 
    cm.Address_second_line,
    cm.City, 
    cm.State, 
    cm.Zip,
    row_number() over (partition by sm.Zip order by sm.Zip desc) rowNum
    From Customer_Master sm
    Inner Join Customer_Data_Zip_Codes cm ON cm.Zip = sm.Zip
) x
where x.rowNum = 1
