#include "cbase.h"

#include "convar.h"

#include "devicebaseinfo.h"

// memdbgon must be the last include file in a .cpp file!!!
#include "tier0/memdbgon.h"

CON_COMMAND(gpu_info, "")
{

	MaterialAdapterInfo_t adapterInfo;
	materials->GetDisplayAdapterInfo(materials->GetCurrentAdapter(), adapterInfo);

	//Start videocard check
	Msg("%s\n", "- - - - - - - - Checking your  GPU - - - - - - - -");

	if (adapterInfo.m_VendorID == 0x1002)
	{
		Msg("%s\n", "Hey guys, that mate have AMD/ATI card.");
	}
	else if (adapterInfo.m_VendorID == 0x10de)
	{
		Msg("%s\n", "Hey guys, that mate have Nvidia card.");
	}
	else if (adapterInfo.m_VendorID == 0x8086)
	{
		Msg("%s\n", "Hey guys, that mate have Intel card.");
	}
	//End videocard check

}

/* 

-- From Ficool --
[19:46] use materialsystem's GetDisplayAdapterInfo
[19:47] public/imaterialsystem.h
[19:48] vendorID will identify the manufacturer, see the bin/dxsupport.cfg in a source engine install for what ID corresponds to what manufacturer
[19:48] or to save you some time
[19:48] 0x1002 = ATI/AMD
[19:49] 0x10de = Nvidia
[19:49] 0x8086 = Intel
[19:51] note: you might stumble upon the convenient "GetVideoCardIdentifier" function but dont use that, it doesnt work as valve removed its functionality

-- From Soyka --
For work with VendorID, add this:

#include "materialsystem/imaterialsystem.h"
MaterialAdapterInfo_t adapterInfo;
if( adapterInfo.m_VendorID == 0x1002 )
{}

*/