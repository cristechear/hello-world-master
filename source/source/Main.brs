'*************************************************************
'** Hello World example 
'** Copyright (c) 2015 Roku, Inc.  All rights reserved.
'** Use of the Roku Platform is subject to the Roku SDK License Agreement:
'** https://docs.roku.com/doc/developersdk/en-us
'*************************************************************

sub Main()
    print "in showChannelSGScreen"
    'Indicate this is a Roku SceneGraph application'
    screen = CreateObject("roSGScreen")
    m.port = CreateObject("roMessagePort")
    screen.setMessagePort(m.port)

    'Create a scene and load /components/helloworld.xml'
    scene = screen.CreateScene("HelloWorld")
    screen.show()

    sendAddress = CreateObject("roSocketAddress")
    sendAddress.SetAddress("devsocket.stedi.me:54321")
    socket = CreateObject("roStreamSocket")
    socket.setSendToAddress(sendAddress)
    If socket.Connect()
        
        socket.sendStr("76314c33-3065-4505-bad9-e01f0b9091fa:agc768@ensign.edu")
        Print "Connected Succesfully"
        while true
                ' Read a specific amount of data from the socket and store it in a string
                data = socket.ReceiveStr(1024) ' Read up to 1024 bytes (adjust the length as needed)
                
                ' Check if any data was received
                if data <> ""
                    ' Display the received data in the terminal
                    print data
            end if
            
        end while
    End if

    while(true)
        msg = wait(0, m.port)
        msgType = type(msg)
        if msgType = "roSGScreenEvent"
            if msg.isScreenClosed() then return
        end if
    end while
end sub

