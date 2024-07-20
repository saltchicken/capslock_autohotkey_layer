
CapsLock::Return               ;Disables CapsLock
;CapsLock::Send, {Escape}        ;CapsLock is now Escape


global keySequence := ""
global stateActive := false

CapsLock & a::HandleKey("a")
CapsLock & b::HandleKey("b")  
CapsLock & c::HandleKey("c") 
CapsLock & d::HandleKey("d")
CapsLock & h::HandleKey("h")
CapsLock & j::HandleKey("j")
CapsLock & k::HandleKey("k")
CapsLock & l::HandleKey("l")
CapsLock & o::HandleKey("o")
CapsLock & w::HandleKey("w")



HandleKey(key) {
    global keySequence
    
    if (stateActive = true) {
        keySequence := keySequence . key
        
        if (keySequence = "abc") {
            MyFunction()
            keySequence := ""
        }
        
        SetTimer ResetSequence, 250
    }
    else {
        keySequence := ""

        if (key == "h"){
            Send, {Left}
            return
        }
        if (key == "j"){
            Send, {Down}
            return
        }
        if (key == "k"){
            Send, {Up}
            return
        }
        if (key == "l"){
            Send, {Right}
            return
        }
        if (key == "w"){
            Send, ^{Left}+^{Right} ;Select current word
            return
        }
        if (key == "o"){
            Send, {End}
            Send, {Enter} 
            return
        }
    }
}

ResetSequence:
    keySequence := ""
return

MyFunction() {
    MsgBox Key sequence triggered!
}



CapsLock & `;:: 
    global stateActive  ; Declare stateActive as global
    stateActive := !stateActive
    if (stateActive)
        Tooltip, State is now ACTIVE
    else
        Tooltip, State is now INACTIVE
    SetTimer RemoveToolTip, -2000
return


RemoveToolTip:
    global stateActive
    stateActive := false
    Tooltip
return
