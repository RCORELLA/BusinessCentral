namespace RCB;

permissionset 50110 "RCB Vehiculos"
{
    Assignable = true;
    Permissions = tabledata "RCB Modelos" = RIMD,
        tabledata "RCB Vehiculos" = RIMD,
        table "RCB Modelos" = X,
        table "RCB Vehiculos" = X;
}