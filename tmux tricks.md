## session
* `<C-a> C-c` creates a new session
* `<C-a> $` name session
* `<C-a> s` list sessions
* `<C-a> d` detach session
* `<C-a> C-f` lets you switch to another session by name
* `<C-a> (` previous session
* `<C-a> )` next session
* `<C-a> L` ‘last’ (previously used) session
* `<C-a> s` choose a session from a list


## window
* `<C-a> c` new window
* `<C-a> ,` name window
* `<C-a> w` list windows
* `<C-a> 1,2,3` switch to window 1,2,3 
* `<C-a> f` find window
* `<C-a> &` kill window
* `<C-a> .` move window - prompted for a new number
* `<C-a> C-h,C-l` let you navigate windows (default * `<C-a> n and * `<C-a> p are unbound)
* `<C-a> Tab` brings you to the last active window

## pane
* `<C-a> %` horizontal split
* `<C-a> "` vertical split
* `<C-a> o` swap panes
* `<C-a> q` show pane numbers
* `<C-a> x` kill pane
* `<C-a> h,j,k,l` let you navigate panes ala Vim
* `<C-a> H,J,K,L` let you resize panes
* `<C-a> <,>` let you swap panes
* `<C-a> +` maximizes the current pane to a new window

## common
* `<C-a> m` toggles mouse mode on or off
* `<C-a> Enter` enters copy-mode
* `<C-l>` clears both the screen and the history
* tmux kill-server


## buffers
* `<C-a> b` lists the paste-buffers
* `<C-a> p` pastes from the top paste-buffer
* `<C-a> P` lets you choose the paste-buffer to paste from


## config
* `<C-a> e` opens ~/.tmux.conf.local with the editor defined by the $EDITOR environment variable (defaults to vim when empty)
* `<C-a> r` reloads the configuration
