
function Storage_GetSettingsFlag(flag,defaultValue=0){
return Storage_GetSettingsGeneral().Get(flag,defaultValue);
}