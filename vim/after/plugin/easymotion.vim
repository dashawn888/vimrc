" Remove all the easymotion extras.
unmap  <Leader>B
unmap  <Leader>W
unmap  <Leader>j
unmap  <Leader>T
unmap  <Leader>ge
unmap  <Leader>w
unmap  <Leader>f
unmap  <Leader>F
unmap  <Leader>t
unmap  <Leader>k
unmap  <Leader>b
unmap  <Leader>gE
unmap  <Leader>E
unmap  <Leader>e

nmap <Leader>ef :call EasyMotionF(1,0)<CR>
nmap <Leader>eb :call EasyMotionF(0,1)<CR>
vmap <Leader>ef :call EasyMotionF(1,0)<CR>
vmap <Leader>eb :call EasyMotionF(0,1)<CR>
