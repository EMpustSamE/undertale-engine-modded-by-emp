function Storage_SetSettingsFlag(flag,value){
var z=Storage_GetSettingsGeneral();
z.Set(flag,value);
return z;
}