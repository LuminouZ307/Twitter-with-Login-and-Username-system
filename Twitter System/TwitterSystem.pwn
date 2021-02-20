/* BACA INI

Kalian diizinkan untuk menggunakan system ini di server kalian, kalian juga diizinkan untuk Rework/Remake
Script ini dengan CATATAN :

- Tidak diperjual belikan

- Tidak di Share lagi melalui Link Receh!

	Jika ingin menyebarkan gunakan link Github milik gw atau link Discord gw!
	
Full Credits by LuminouZ

INGAT ! Copas emang mudah, tapi buat idenya yang sulit, jangan jadi orang bodoh.*/
	

#include <a_samp>
#include <zcmd>
#include <sscanf2>

//Definition
#define COLOR_TWAQUA 0x00FFFF00
#define DIALOG_TWITTER 1
#define strcpy(%0,%1,%2) \
    strcat((%0[0] = '\0', %0), %1, %2)
    
enum twInfo
{
	pUsername[MAX_PLAYER_NAME]
}
new TwitterInfo[MAX_PLAYERS][twInfo];
#if defined FILTERSCRIPT

public OnFilterScriptInit()
{
	print("\n--------------------------------------");
	print(" Twitter System by LuminouZ");
	print("--------------------------------------\n");
	return 1;
}

public OnFilterScriptExit()
{
	return 1;
}

#else

main()
{
	print("\n----------------------------------");
	print(" Twitter System by LuminouZ");
	print("----------------------------------\n");
}

#endif

public OnGameModeInit()
{
	return 1;
}

public OnGameModeExit()
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	return 1;
}

public OnPlayerConnect(playerid)
{
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	return 1;
}

public OnPlayerSpawn(playerid)
{
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

public OnPlayerText(playerid, text[])
{
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	if (strcmp("/mycommand", cmdtext, true, 10) == 0)
	{
		return 1;
	}
	return 0;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	return 1;
}
public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_TWITTER)
	{
		if(response)
		{
		    if(strlen(inputtext) > 0)
		    {
		        format(TwitterInfo[playerid][pUsername], MAX_PLAYER_NAME, "%s", inputtext);
		        SendClientMessage(playerid, COLOR_TWAQUA, "TWITTER : {FFFFFF}Username berhasil dimasukan!!");
			}
		}
  		return 1;
 	}
	return 1;
}
CMD:twhelp(playerid, params[])
{
	SendClientMessage(playerid, -1, "{00FFFF}Twitter Help");
	SendClientMessage(playerid, -1, "{FFFF00}/tw {FFFFFF}Untuk chat Twitter");
	SendClientMessage(playerid, -1, "{FFFF00}/logintw {FFFFFF}Untuk Login Twitter");
	return 1;
}
CMD:logintw(playerid, params[])
{
	new String[128];
	format(String, sizeof(String), "{FFFFFF}Masukan Username {00FFFF}Twitter {FFFFFF}untuk {FFFF00}Log-in");
	ShowPlayerDialog( playerid, DIALOG_TWITTER, DIALOG_STYLE_INPUT, "Twitter Login",String, "Continue", "Cancel" );
	return 1;
}
CMD:tw(playerid, params[])
{
	if(isnull(params))
	{
		SendClientMessage(playerid, 0xCECECEFF, "USAGE : /tw [Twitter Text]");
		return 1;
	}
	new fmt_msg[144];
	format(fmt_msg, sizeof fmt_msg, "[TWITTER] {FFFF00}@%s : {FFFFFF}%s ", TwitterInfo[playerid][pUsername], params);
	SendClientMessageToAll(COLOR_TWAQUA, fmt_msg);
	GivePlayerMoney(playerid, -10);
	return 1;
}

