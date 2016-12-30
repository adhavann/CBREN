import paho.mqtt.client as paho
import os
import socket
import ssl
from time import sleep
from random import uniform
from json import JSONEncoder
import sys
import platform
import time
from apscheduler.schedulers.background import BackgroundScheduler
sched = BackgroundScheduler()

from array import *
from ctypes import *
from __builtin__ import exit

connflag = False
likability=0
count=0
tencount=0
def on_connect(client, userdata, flags, rc):
    global connflag
    connflag = True
    print("Connection returned result: " + str(rc) )

def on_message(client, userdata, msg):
    print(msg.topic+" "+str(msg.payload))

def execute():
    print "likability"
    global likability
    global count
    global tencount
    variable="T"
    likability=likability/count
    print likability
    if(likability*1.2>0.5567):
        likability=1
    else:
        likability=0
    #likabilityData=JSONEncoder().encode({"likability":likability})
    mqttc.publish("$aws/things/HCI-EEG/shadow/update", likability, qos=0)
    tencount=tencount+1
    if(tencount==10):
        mqttc.publish("$aws/things/HCI-EEG/shadow/update",variable,qos=0)
        tencount=0
    print likability
    likability=0
    count=0

mqttc = paho.Client()
mqttGame=paho.Client()

mqttc.on_connect = on_connect
mqttc.on_message = on_message

mqttGame.on_connect=on_connect
mqttGame.on_message=on_message

userId=raw_input("Please enter the userID to continue")

#------- CREDENTIALS
awshost = "a2rg1uowiwcfib.iot.us-west-2.amazonaws.com"
awsport = 8883
clientId = "1883c"
thingName = "HCI_EEG"
caPath = "D:\\1.HCI_CBREN\\Final\\community-sdk-master\\credential\VeriSign-Class 3-Public-Primary-Certification-Authority-G5.pem"
certPath = "D:\\1.HCI_CBREN\\Final\community-sdk-master\\credential\9904349819-certificate.pem.crt"
keyPath = "D:\\1.HCI_CBREN\\Final\\community-sdk-master\\credential\\9904349819-private.pem.key"

mqttc.tls_set(caPath, certfile=certPath, keyfile=keyPath, cert_reqs=ssl.CERT_REQUIRED, tls_version=ssl.PROTOCOL_TLSv1_2, ciphers=None)
mqttc.connect(awshost, awsport, keepalive=60)
mqttGame.connect("iot.eclipse.org",1883,keepalive=60)
mqttc.loop_start()
mqttGame.loop_start()

try:
    if sys.platform.startswith('win32'):
        libEDK = cdll.LoadLibrary("../../bin/win32/edk.dll")
    elif sys.platform.startswith('linux'):
        srcDir = os.getcwd()
	if platform.machine().startswith('arm'):
            libPath = srcDir + "/../../bin/armhf/libedk.so"
	else:
            libPath = srcDir + "/../../bin/linux64/libedk.so"
        libEDK = CDLL(libPath)
    else:
        raise Exception('System not supported.')
except Exception as e:
    print 'Error: cannot load EDK lib:', e
    exit()

IEE_EmoEngineEventCreate = libEDK.IEE_EmoEngineEventCreate
IEE_EmoEngineEventCreate.restype = c_void_p
eEvent = IEE_EmoEngineEventCreate()

IEE_EmoEngineEventGetEmoState = libEDK.IEE_EmoEngineEventGetEmoState
IEE_EmoEngineEventGetEmoState.argtypes = [c_void_p, c_void_p]
IEE_EmoEngineEventGetEmoState.restype = c_int

IEE_EmoStateCreate = libEDK.IEE_EmoStateCreate
IEE_EmoStateCreate.restype = c_void_p
eState = IEE_EmoStateCreate()

userID = c_uint(0)
user   = pointer(userID)
ready  = 0
state  = c_int(0)

alphaValue     = c_double(0)
low_betaValue  = c_double(0)
high_betaValue = c_double(0)
gammaValue     = c_double(0)
thetaValue     = c_double(0)

alpha     = pointer(alphaValue)
low_beta  = pointer(low_betaValue)
high_beta = pointer(high_betaValue)
gamma     = pointer(gammaValue)
theta     = pointer(thetaValue)

channelList = array('I',[5, 14])   # IED_AF3, IED_AF4, IED_T7, IED_T8, IED_Pz

# -------------------------------------------------------------------------
if libEDK.IEE_EngineConnect("Emotiv Systems-5") != 0:
        print "Emotiv Engine start up failed."
        exit();

alphaArr=[-1]*2
betaArr=[-1]*2
thetaArr=[-1]*2
# sched.add_job(execute, 'interval', seconds=1)
# schedule=True
while (1):
    state = libEDK.IEE_EngineGetNextEvent(eEvent)

    if state == 0:
        eventType = libEDK.IEE_EmoEngineEventGetType(eEvent)
        libEDK.IEE_EmoEngineEventGetUserId(eEvent, user)
        if eventType == 16:  # libEDK.IEE_Event_enum.IEE_UserAdded
            ready = 1
            libEDK.IEE_FFTSetWindowingType(userID, 1);  # 1: libEDK.IEE_WindowingTypes_enum.IEE_HAMMING
            print "User added"

        if ready == 1:
            j=-1
            for i in channelList:
                result = c_int(0)
                result = libEDK.IEE_GetAverageBandPowers(userID, i, theta, alpha, low_beta, high_beta, gamma)
                #print (thetaValue, alphaValue,low_betaValue, high_betaValue, gammaValue,i)
                j=j+1
                if result == 0:    #EDK_OK
                    print "%.6f, %.6f, %.6f, %.6f, %.6f %d\n" % (thetaValue.value, alphaValue.value,
                                                               low_betaValue.value, high_betaValue.value, gammaValue.value,i)
                    alphaArr[j]=alphaValue.value
                    betaArr[j]=(low_betaValue.value+high_betaValue.value)/2
                    thetaArr[j]=thetaValue.value


            if connflag == True:
                alphaAvg=(alphaArr[0]+alphaArr[1])/2
                betaAvg=(betaArr[0]+betaArr[1])/2
                thetaAvg=(thetaArr[0]+thetaArr[1])/2
                insertData=JSONEncoder().encode({"Valence":((alphaArr[0]/betaArr[0])-(alphaArr[1]/betaArr[1]))})
                if(alphaAvg!=-1):
                    #mqttc.publish("$aws/things/HCI-EEG/shadow/update", insertData, qos=0)
                    mqttGame.publish("hci/brainwaves/result",insertData,qos=0)
                likability=likability+betaAvg/(alphaAvg+thetaAvg)
                count=count+1
                execute()
                # if(schedule):
                #     print "inside schedule TRUE"
                #     sched.start()
                #     schedule=False
                print("msg sent:" + insertData )
            else:
                print("waiting for connection...")
            alphaArr=[-1,-1]
            betaArr=[-1,-1]
            thetaArr=[-1,-1]
    elif state != 0x0600:
        print "Internal error in Emotiv Engine ! "
    time.sleep(0.3)
# -------------------------------------------------------------------------
libEDK.IEE_EngineDisconnect()
libEDK.IEE_EmoStateFree(eState)
libEDK.IEE_EmoEngineEventFree(eEvent)
