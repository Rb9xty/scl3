local timerOfset = {}
local blocker = {}
local aWait = {}
local ofsetOffsets = {}
local ofsetValues = {}

blocker = 0
gg.toast("\nLoading...")
gg.sleep("2000")

bitS = gg.choice({"32 Bit", "64 Bit"},nil, "Please select your device.")
if bitS == 1 then
  gg.setRanges(gg.REGION_ANONYMOUS)
  timerOfset = 0x74
end
if bitS == 2 then
  gg.setRanges(gg.REGION_C_ALLOC)
  timerOfset = 0x9c
end
gg.alert[[
[ By SimpleCodeStudio ]
------------------------------------------------------------
SIMCITY PREMIUM SCRIPT
(Recommending Android 10 or lower version)
------------------------------------------------------------
What's New?
Updated: 19/08/2023

✓- Now premium script is available.

------------------------------------------------------------
]]

function protection()
  p = gg.prompt({"Protection Key:"}, {"PRESS OK"}, {"text"})
  if p == nil then
  else
  if p[1] == "PRESS OK" then
    gg.toast("\nProtection key is correct.")
    aWait = 0
    mainMenu()
    else
      gg.alert("Already password is PRESS OK.")
      return
  end
  end
end

function valueNotFound()
	gg.alert('Value not found. Please contact the developer for new functions. Or Active "Expand search bar"')
    return
    mainMenu()
end

function ofsets()
  gg.sleep("200")
  R = gg.getResults(1)
  local ofset = {}
  ofset[1] = {}
  ofset[1].address = R[1].address + ofsetOffsets
  ofset[1].flags = gg.TYPE_DWORD
  ofset[1].value = ofsetValues
  ofset[1].freeze = false
  gg.addListItems(ofset)
  gg.setValues(ofset)
  gg.setVisible(false)
end

function mainMenu()
  
  m1 = gg.choice({"⭐┃Premium", "⌛┃Set 0 All Production and Nano timers", "💵┃48k simcash", "💰┃40m simoleon", "❌┃Exit", "⚙┃Expand search bar"},nil,"[BETA] Your date is: "..os.date("%d/%m/%Y"))
  
  if m1 == 1 then
    gg.toast("\nAlready you're using Premium script")
  end
  
  if m1 == 2 then
		if blocker == 1 then
		b = gg.alert("You already reset the time. But do you want use again?", "YES", "NO")
  		if b == 1 then
  		  blocker = 0
  		  gg.toast("\nYou can use again now.")
  		  return
  		end
		end
		if blocker == 0 then
		gg.toast("\nPlease Wait...")
		gg.clearResults()
			gg.searchNumber("9900000",gg.TYPE_DWORD)
		  if gg.getResultsCount() == 0 then
			valueNotFound()
			blocker = 1
			return
			end
		R = gg.getResults(1)
		local ofset = {}
		ofset[1] = {}
		ofset[1].address = R[1].address + 4
		ofset[1].flags = gg.TYPE_DWORD
		ofset[1].freeze = false
		gg.addListItems(ofset)
		gg.setVisible(false)
		get = gg.getListItems("1")
		gg.sleep("200")
		if get[1].value == 0 then
		  ofsetOffsets = 4
		  ofsetValues = 0
		  ofsets()
  		gg.clearResults()
  			gg.searchNumber("9900000",gg.TYPE_DWORD)
		end
		R2 = gg.getResults(1)
		ofset[1] = {}
		ofset[1].address = R2[1].address - timerOfset
		ofset[1].flags = gg.TYPE_DWORD
		ofset[1].freeze = false
		gg.addListItems(ofset)
		gg.setVisible(false)
		gg.sleep("200")
		get2 = gg.getListItems("1")
		gg.clearResults()
		gg.searchNumber(get2[1].value,gg.TYPE_DWORD)
		local rslt = gg.getResults("108")
		gg.addListItems(rslt)
		rslt = nil
		
		
		local copy = false
		local rslt = gg.getListItems()
		if not copy then gg.removeListItems(rslt) end
		for i, v in ipairs(rslt) do
		v.address = v.address + timerOfset
		if copy then v.name = v.name..' #2' end
		end
		gg.addListItems(rslt)
		t = nil
		copy = nil
		
		
		revert = gg.getListItems()
		local rslt = gg.getListItems()
		for i, v in ipairs(rslt) do
		if v.flags == gg.TYPE_DWORD then
			v.value = "0"
			v.freeze = false
			v.freezeType = gg.FREEZE_NORMAL
		end
		end
		gg.addListItems(rslt)
		gg.setValues(rslt)
		rslt = nil
		gg.clearResults()
		gg.clearList()
		gg.toast("\nSuccessful")
		blocker = 1
	  end
	end
  
  if m1 == 3 then
    pp = gg.prompt({"Enter your simcash value"})
    sm = gg.choice({"King", "Megalopolis", "Master of Simoleons", "Countess"},nil,"Select a Achivements.")
	if sm == 1 then
		smKing = gg.choice({"Level 1", "Level 2", "Level 3"},nil, 'Select "King" Achivements level.')

		if smKing == 1 then
			gg.toast("\nPlease Wait...")
			gg.clearResults()
			gg.searchNumber("3000000;20::8",gg.TYPE_DWORD)
			if gg.getResultsCount() == 0 then
				valueNotFound()
			end
			gg.refineNumber("3000000")
			gg.getResults(1)
			gg.editAll("0",gg.TYPE_DWORD)
			ofsetOffsets = 4
			ofsetValues = 48000 - pp[1]
			ofsets()
			gg.toast("\nSuccessful")
			gg.clearResults()gg.clearList()
		end
		if smKing == 2 then
			gg.toast("\nPlease Wait...")
			gg.clearResults()
			gg.searchNumber("10000000;30::8",gg.TYPE_DWORD)
			if gg.getResultsCount() == 0 then
				valueNotFound()
			end
			gg.refineNumber("10000000")
			gg.getResults(1)
			gg.editAll("0",gg.TYPE_DWORD)
			ofsetOffsets = 4
			ofsetValues = 48000 - pp[1]
			ofsets()
			gg.toast("\nSuccessful")
			gg.clearResults()gg.clearList()
		end
		if smKing == 3 then
			gg.toast("\nPlease Wait...")
			gg.clearResults()
			gg.searchNumber("20000000;100::8",gg.TYPE_DWORD)
			if gg.getResultsCount() == 0 then
				valueNotFound()
			end
			gg.refineNumber("20000000")
			gg.getResults(1)
			gg.editAll("0",gg.TYPE_DWORD)
			ofsetOffsets = 4
			ofsetValues = 48000 - pp[1]
			ofsets()
			gg.toast("\nSuccessful")
			gg.clearResults()gg.clearList()
		end
	end
	if sm == 2 then
		smMp = gg.choice({"Level 1", "Level 2", "Level 3"},nil, 'Select "Megalopolis" Achivements level.')

		if smMp == 1 then
			gg.toast("\nPlease Wait...")
			gg.clearResults()
			gg.searchNumber("1500000;32::8",gg.TYPE_DWORD)
			if gg.getResultsCount() == 0 then
				valueNotFound()
			end
			gg.refineNumber("1500000")
			gg.getResults(1)
			gg.editAll("0",gg.TYPE_DWORD)
			ofsetOffsets = 4
			ofsetValues = 48000 - pp[1]
			ofsets()
			gg.toast("\nSuccessful")
			gg.clearResults()
		end
		if smMp == 2 then
			gg.toast("\nPlease Wait...")
			gg.clearResults()
			gg.searchNumber("2000000;36::8",gg.TYPE_DWORD)
			if gg.getResultsCount() == 0 then
				valueNotFound()
			end
			gg.refineNumber("2000000")
			gg.getResults(1)
			gg.editAll("0",gg.TYPE_DWORD)
			ofsetOffsets = 4
			ofsetValues = 48000 - pp[1]
			ofsets()
			gg.toast("\nSuccessful")
			gg.clearResults()gg.clearList()
		end
		if smMp == 3 then
			gg.toast("\nPlease Wait...")
			gg.clearResults()
			gg.searchNumber("2500000;40::8",gg.TYPE_DWORD)
			if gg.getResultsCount() == 0 then
				valueNotFound()
			end
			gg.refineNumber("2500000")
			gg.getResults(1)
			gg.editAll("0",gg.TYPE_DWORD)
			ofsetOffsets = 4
			ofsetValues = 48000 - pp[1]
			ofsets()
			gg.toast("\nSuccessful")
			gg.clearResults()gg.clearList()
		end
	end
	if sm == 3 then
		smMos = gg.choice({"Level 1", "Level 2", "Level 3"},nil, 'Select "Master of Simoleons" Achivements level.')

		if smMos == 1 then
			gg.toast("\nPlease Wait...")
			gg.clearResults()
			gg.searchNumber("1500000;3::8",gg.TYPE_DWORD)
			if gg.getResultsCount() == 0 then
				valueNotFound()
			end
			gg.refineNumber("1500000")
			gg.getResults(1)
			gg.editAll("0",gg.TYPE_DWORD)
			ofsetOffsets = 4
			ofsetValues = 48000 - pp[1]
			ofsets()
			gg.toast("\nSuccessful")
			gg.clearResults()gg.clearList()
		end
		if smMos == 2 then
			gg.toast("\nPlease Wait...")
			gg.clearResults()
			gg.searchNumber("3000000;10::8",gg.TYPE_DWORD)
			if gg.getResultsCount() == 0 then
				valueNotFound()
			end
			gg.refineNumber("3000000")
			gg.getResults(1)
			gg.editAll("0",gg.TYPE_DWORD)
			ofsetOffsets = 4
			ofsetValues = 48000 - pp[1]
			ofsets()
			gg.toast("\nSuccessful")
			gg.clearResults()gg.clearList()
		end
		if smMos == 3 then
			gg.toast("\nPlease Wait...")
			gg.clearResults()
			gg.searchNumber("5000000;30::8",gg.TYPE_DWORD)
			if gg.getResultsCount() == 0 then
				valueNotFound()
			end
			gg.refineNumber("5000000")
			gg.getResults(1)
			gg.editAll("0",gg.TYPE_DWORD)
			ofsetOffsets = 4
			ofsetValues = 48000 - pp[1]
			ofsets()
			gg.toast("\nSuccessful")
			gg.clearResults()gg.clearList()
		end
	end
	if sm == 4 then
		smCt = gg.choice({"Level 1", "Level 2", "Level 3"},nil, 'Select "Countess" Achivements level.')

		if smCt == 1 then
			gg.toast("\nPlease Wait...")
			gg.clearResults()
			gg.searchNumber("200000;10::8",gg.TYPE_DWORD)
			if gg.getResultsCount() == 0 then
				valueNotFound()
			end
			gg.refineNumber("200000")
			gg.getResults(1)
			gg.editAll("0",gg.TYPE_DWORD)
			ofsetOffsets = 4
			ofsetValues = 48000 - pp[1]
			ofsets()
			gg.toast("\nSuccessful")
			gg.clearResults()gg.clearList()
		end
		if smCt == 2 then
			gg.toast("\nPlease Wait...")
			gg.clearResults()
			gg.searchNumber("500000;20::8",gg.TYPE_DWORD)
			if gg.getResultsCount() == 0 then
				valueNotFound()
			end
			gg.refineNumber("500000")
			gg.getResults(1)
			gg.editAll("0",gg.TYPE_DWORD)
			ofsetOffsets = 4
			ofsetValues = 48000 - pp[1]
			ofsets()
			gg.toast("\nSuccessful")
			gg.clearResults()gg.clearList()
		end
		if smCt == 3 then
			gg.toast("\nPlease Wait...")
			gg.clearResults()
			gg.searchNumber("1500000;40::8",gg.TYPE_DWORD)
			if gg.getResultsCount() == 0 then
				valueNotFound()
			end
			gg.refineNumber("1500000")
			gg.getResults(1)
			gg.editAll("0",gg.TYPE_DWORD)
			ofsetOffsets = 4
			ofsetValues = 48000 - pp[1]
			ofsets()
			gg.toast("\nSuccessful")
			gg.clearResults()gg.clearList()
		end
	end
  end
  
  if m1 == 4 then
	aw = gg.alert("WARNING\nPlease make sure you are in the section to receive 2000 Simoleon in the war pass.", "OK WAIT", "IM READY")
	if aw == 1 then
		gg.toast("\nI waiting u...")
		return
	end
    gg.toast("\nPlease Wait...")
    gg.clearResults()
    gg.searchNumber("2000;1;1;100;500::326",gg.TYPE_DWORD)
    if gg.getResultsCount() == 0 then
		valueNotFound()
    end
    gg.refineNumber("2000")
    gg.getResults("200")
    gg.editAll("40000000",gg.TYPE_DWORD)
    gg.toast("\nSuccessful")
    gg.clearResults()gg.clearList()
  end
  
  if m1 == 5 then
    print("EXIT SUCCESSFUL")
    gg.setVisible(true)
    os.exit()
  end
  
  if m1 == 6 then
	  gg.setRanges(gg.REGION_JAVA_HEAP | gg.REGION_C_HEAP | gg.REGION_C_ALLOC | gg.REGION_C_DATA | gg.REGION_C_BSS | gg.REGION_PPSSPP | gg.REGION_ANONYMOUS | gg.REGION_JAVA | gg.REGION_STACK | gg.REGION_ASHMEM | gg.REGION_VIDEO | gg.REGION_OTHER | gg.REGION_BAD | gg.REGION_CODE_APP | gg.REGION_CODE_SYS)
	  gg.toast("\nActivated.")
  end
end



aWait = 2

gg.showUiButton()
while true do
  if gg.isClickedUiButton() then
    gg.setVisible(false)
    if aWait == 0 then
      mainMenu()
    end

    if aWait == 2 then
      protection()
    end
  end
end
