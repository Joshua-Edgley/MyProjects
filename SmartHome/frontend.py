from backend import SmartPlug
from backend import SmartHeater
from backend import SmartHome
from tkinter import *

# Imports all backend and tkinter classes

global smrthm
smrthm = SmartHome()
global mainWin
mainWin = Tk()

# Setting of global variables 

keys = ['c', 'p', 'p', 'c', 'c'] 

# Each letter corrsponds to the type of device stored in the smart home object

def main():
    '''Executes the 'setupHome' and 'GUI' function'''
    setupHome()
    GUI()  
                                                               
def setupHome():
    '''Creates an instance of the 'SmartHome' class and adds devices to it '''
    smrthtr1 = SmartHeater()
    smrtplg1 = SmartPlug()
    smrtplg2 = SmartPlug()
    smrthtr2 = SmartHeater()
    smrthtr3 = SmartHeater()

    devices = [smrthtr1, smrtplg1, smrtplg2, smrthtr2, smrthtr3]
    
    for device in devices:
        smrthm.addDevice(device) 
        
    # quicker way of adding devices to smart home object using a loop and a list

def GUI():
    '''Creates a Graphical User Interface (GUI) to control devices within the 'SmartHome' class'''

    mainWin.title("Smart Home")
    mainWin.resizable(False, False)
    NumOfDevicesOn = 0  

    # The above creates the basic window structure           

    turnOffAll = Button(mainWin, text="Turn All Off", command = turnAllOffHandler)
    turnOnAll = Button(mainWin, text="Turn All On", command = turnAllOnHandler)
    addDevice = Button(mainWin, text="Add Device", command = lambda: addDeviceHandler())
    turnOffAll.grid(row=1, column = 0)
    turnOnAll.grid(row=2, column=0)
    addDevice.grid(row=1, column=1)

    # Adds buttons to GUI


    for i in range (len(smrthm.Devices)):
        if smrthm.Devices[i].switchedOn == True:
            NumOfDevicesOn += 1
    
    # Keeps track of the devices that are currently 'on'
    
    for i in range(len(smrthm.Devices)):
        device = Text(mainWin, height = 1, width = 40)
        device.insert('1.0', str(smrthm.Devices[i]))
        toggleThis= Button(mainWin, text="Toggle This", command = lambda index = i: toggleThisHandler(index))
        modifyThis = Button(mainWin, text="Modify This", command = lambda index = i: modifyThisHandler(index))
        deleteDevice = Button(mainWin, text="Delete Device", command = lambda index = i: deleteDeviceHandler(index))
        device.grid(row=i+3, column=0)
        toggleThis.grid(row=i+3, column=1)
        modifyThis.grid(row=i+3, column=2)
        deleteDevice.grid(row=i+3, column=3)
        devicesTurnedOn = Label(mainWin, text="Number Of Devices On: {} ".format(NumOfDevicesOn))
        devicesTurnedOn.grid(row=i+4, column=0)

    # Adds each device within the smart home device list as well as the buttons that control each device 

                                

    mainWin.mainloop()

def turnAllOffHandler():
    '''Gives the "Turn All Off" button functionality '''
    smrthm.turnOffAll()
    GUI()

def turnAllOnHandler():
    '''Gives the "Turn All On" button functionality '''
    smrthm.turnOnAll()
    GUI()

def toggleThisHandler(index):
    '''Gives the different "Toggle This" buttons functionality
        :param int index: The index of the device that corresponds to the "Toggle This" button'''

    smrthm.Devices[index].ToggleSwitch()
    GUI()

def modifyThisHandler(index):

    '''Gives the different "Modify This" buttons functionality and allows
        the user to change a devices settings.
        param: int index: The index of the device that corresponds to 
        the "Modify This" button'''

    title = ''
    text = ''
    modifyWin = Tk()
    modifyWin.resizable(False, False)

    # Structure of window

    if keys[index] == 'c':
        title = 'Smart Heater'
        text = 'Enter a setting between 0 and 5:'
    else:
        title = 'Smart Plug'
        text ='Enter a Consompution rate between 0 and 150:'
    
    # Check for device type to correctly display suitable title and instructions 


    modifyWin.title("Modify {}".format(title))
    modifyLabel = Label(modifyWin, text=text)
    modifyText = Text(modifyWin, height = 1, width = 20)
    modifyLabel.grid(row=0, column=0)
    modifyText.grid(row=1, column=0)
    modifyButton = Button(modifyWin, text="Modify", command= lambda: getInput())
    modifyButton.grid(row=2, column=0)

    # Adds widgets to new pop up window
    
    def getInput():
        '''Reads the users input within the text widget and sets the new status'''
        input = modifyText.get("1.0", END)
        input.strip()

        # reads and then truncates the users input

        if keys[index] == 'c':
            if 0<= int(input) <= 5:
                smrthm.Devices[index].SetSetting(input)
        else:
            if 0<= int(input) <= 150:
                smrthm.Devices[index].SetConsumptionRate(input)

        # modifies the correct varaiables and checks if the inputted values satisfy the given paramaters
        
        modifyWin.destroy()

        #closes the modification window

        GUI()
    
    modifyWin.mainloop()
        
def addDeviceHandler():
    '''Adds functionality to the add device button. Adds a new device of choice 
        to the end of the list of devices'''
    def addPlugHandler():
        '''add a new plug to the list of devices and add a 'p' to the keys list'''
        keys.append('p')
        NewPlug = SmartPlug()
        smrthm.addDevice(NewPlug)
        addWin.destroy()
        GUI()

    def addHeaterHandler():
        '''add a new heater to the list of devices and add a 'c' to the keys list'''
        keys.append('c')
        NewHeater = SmartHeater()
        smrthm.addDevice(NewHeater)
        addWin.destroy()
        GUI()

    addWin = Tk()
    addWin.title('Choose')
    addWin.resizable(False,False)
    plugButton = Button(addWin, text="Plug", command= lambda: addPlugHandler())
    heaterButton = Button(addWin, text="Heater", command= lambda: addHeaterHandler())
    plugButton.grid(row=1, column=0)
    heaterButton.grid(row=1, column=2)

def deleteDeviceHandler(index):
    '''Adds functionality to the "Delete This" button
       :param int index: The index of the device that is to be deleted'''

    del smrthm.Devices[index]
    del keys[index]
 
    # These two lines remove the key and device from each list

    for widgets in mainWin.winfo_children():
        widgets.destroy()

    # These two lines delete the previous widgets
    GUI()


main()