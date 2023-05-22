{ config, lib, pkgs, ... }:

{
  imports = [ ./theme.nix ];
  xdg.configFile."WebCord/Preferences".text = ''
  {"electron":{"devtools":{"preferences":{"Inspector.drawerSplitViewState":"{\"horizontal\":{\"size\":0,\"showMode\":\"OnlyMain\"}}","InspectorView.splitViewState":"{\"vertical\":{\"size\":587.671875}}","Styles-pane-sidebar-tabOrder":"{\"Styles\":10,\"Computed\":20}","adornerSettings":"[{\"adorner\":\"grid\",\"isEnabled\":true},{\"adorner\":\"flex\",\"isEnabled\":true},{\"adorner\":\"ad\",\"isEnabled\":true},{\"adorner\":\"scroll-snap\",\"isEnabled\":true},{\"adorner\":\"container\",\"isEnabled\":true},{\"adorner\":\"slot\",\"isEnabled\":true},{\"adorner\":\"top-layer\",\"isEnabled\":true},{\"adorner\":\"reveal\",\"isEnabled\":true}]","closeableTabs":"{\"security\":true}","colorFormat":"\"original\"","currentDockState":"\"right\"","elements.styles.sidebar.width":"{\"vertical\":{\"size\":0,\"showMode\":\"OnlyMain\"}}","inspectorVersion":"35"}},"media":{"device_id_salt":"26A3802D5C6093E57C59B2C2908CE122"}},"extensions":{"settings":{"aejipigdkogdhhicponpbenjddegldaj":{"preferences":{"install_time":"13328572537833143"}},"jnicakejaejakigoijahgcbapfidgebb":{"preferences":{"install_time":"13329093014960434"}},"mkclhlmmapacpmoeaagpkoiioinpcibg":{"preferences":{"install_time":"13329229948755909"}}}},"partition":{"per_host_zoom_levels":{"13800490217704911688":{}}},"spellcheck":{"dictionaries":["en-US"],"dictionary":""}}
  '';
}
