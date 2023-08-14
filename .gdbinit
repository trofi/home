# 'blue' is too dark on black background
set style address foreground magenta
set style disassembler immediate foreground cyan

# allow debugging threading details using current libc
add-auto-load-safe-path /lib64/libthread_db-1.0.so
