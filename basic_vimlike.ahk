
;CapsLock::Return               ;Disables CapsLock
;CapsLock::Send, {Escape}        ;CapsLock is now Escape

CapsLock & h::Send, {Left}
CapsLock & j::Send, {Down}
CapsLock & k::Send, {Up}
CapsLock & l::Send, {Right}

CapsLock & w::Send, ^{Left}+^{Right} ;Select current word

CapsLock & o::
    Send, {End}
    Send, {Enter} 
return
