
///
/// HA Configuration
///
const int configAdapterTypeId = 0;
const String configBoxName = 'configs';

///
/// Device infos and state
///
/// Item key is the deviceId
/// 
const int deviceAdapterTypeId = 1;
const String deviceBoxName = 'devices';

///
/// Device list
///
const int deviceComparableAdapterTypeId = 2;
const String deviceListBoxName = 'deviceList';
const String deviceListHiveKey = 'deviceList';

/// 
/// Flex tab list
/// 
const int flexTabAdapterTypeId = 3;
const String flexTabListBoxName = 'flexTabList';
const String flexTabListHiveKey = 'flexTabList';

/// 
/// Flex card list of each tab
/// 
/// Item key is the tabId
/// 
const int flexCardAdapterTypeId = 4;
const String flexCardListBoxName = 'flexCardList';