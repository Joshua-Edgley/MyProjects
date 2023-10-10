class SmartPlug:
    ''' class responsible for creating a smart plug object'''
    
    def __init__(self):
        ''' constructor for smart plug'''
        self.switchedOn = False
        self.consumptionRate = 0

    def ToggleSwitch(self):
        ''' toggles the 'switchedOn property of a smart plug '''
        self.switchedOn = not self.switchedOn

    def GetSwitchStatus(self):
        ''' returns the weather switch  is on or off '''
        return self.switchedOn
    
    def GetConsumptionRate(self):
        ''' returns the consumption rate'''
        return self.consumptionRate
    
    def SetConsumptionRate(self, consumptionRate):
        ''' sets the consumption rate to the specified parameter 
                :param int consumptionRate : the consumption rate'''
        self.consumptionRate = consumptionRate
    
    def __str__(self):
        ''' returns a string representation of a smart plug object'''
        return 'Smart plug: ' + ('on' if self.switchedOn else 'off') + ', Consumption rate: ' + str(self.consumptionRate)


def testSmartPlug():
    '''Tests the functionality of the 'SmartPlug'''


    smrtplg = SmartPlug()
    
    smrtplg.ToggleSwitch()

    print(smrtplg.GetSwitchStatus())

    print(smrtplg.GetConsumptionRate())

    smrtplg.SetConsumptionRate(10)

    print(smrtplg.GetConsumptionRate())

    print(smrtplg)


class SmartHeater(SmartPlug):
    '''class responsible for creating a smart heater object'''

    def __init__(self):
        '''Constructor of a Smart Heater'''
        self.switchedOn = False
        self.setting = 0
    
    def GetSetting(self):
        ''' returnes the setting of the smart heaters 'setting' property'''
        return self.setting
    
    def SetSetting(self, setting):
        ''' sets the setting of the smart heaters 'setting' property to a 
            sepecified value parameter
                :param int setting :setting'''
        self.setting = setting

    def __str__(self):
        '''returns a string representation of a smart heater object'''
        return 'Smart Heater:  ' + ('on' if self.switchedOn else 'off') + ', Setting: ' + str(self.setting) 


def testDevice():
    '''Tets the functionality of the 'SmartHeater' class'''


    smrthtr = SmartHeater()

    smrthtr.ToggleSwitch()

    print(smrthtr.GetSwitchStatus())

    print(smrthtr.GetSetting())

    smrthtr.SetSetting(1)

    print(smrthtr.GetSetting())

    print(smrthtr)

    
class SmartHome:

    '''class responsible for making a smart home object'''

    def __init__(self):
        '''constructor for SmartHome''' 
        self.Devices = []

    def getDevices(self):
        '''returns a list of devices within a smart home object'''
        return self.Devices
       
    
    def getDeviceAt(self, index):
        '''returns the device at the specified index
            :param int index: the index of the device'''
        return self.Devices[index]
    
    def addDevice(self, device):
        '''adds a device to the list of devices
            :param obj device: the device to add'''
        self.Devices.append(device)

    def toggleSwitch(self, index):
        '''toggle the switchedOn state of the specified device
            :param int index: the index of the device'''
        self.Devices[index].ToggleSwitch()

    def turnOnAll(self):
        '''turn on all devices within 'Devices' '''
        for i  in range(len(self.Devices)):
            self.getDeviceAt(i).switchedOn = True
    
    def turnOffAll(self):
        '''turn off all devices within 'Devices' '''
        for i  in range(len(self.Devices)):
            self.getDeviceAt(i).switchedOn = False
    
    
    def __str__(self):
        '''Returns a string representation of a smart home object'''
        devices = ''
        for i in range(len(self.Devices)):
            devices += str(self.Devices[i]) + '\n'
        return devices
    

def testSmartHome():
    '''tests the functionality of the 'SmartHome' class'''

    smrthm = SmartHome()
    plug1 = SmartPlug()
    plug2 = SmartPlug()
    smrthtr = SmartHeater()

    plug2.ToggleSwitch()

    plug2.SetConsumptionRate(45)

    smrthtr.SetSetting(4)

    smrthm.addDevice(plug1)
    smrthm.addDevice(plug2)
    smrthm.addDevice(smrthtr)

    print(smrthm)

    smrthm.turnOnAll()

    print(smrthm)
    
testSmartPlug()
testDevice()
testSmartHome()

        


