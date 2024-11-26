# Set Ctrl+t as the leader key
unbind C-b
set-option -g prefix C-t
bind-key C-t send-prefix

# No status bar
set-option -g status on
set -g status-fg white
set -g status-bg orange
set -g default-terminal "screen-256color"

# Maximize window with leader m
bind-key m resize-pane -Z

# Resize panes with leader + h/j/k/l
bind h resize-pane -L 5 # Resize pane to the left
bind j resize-pane -D 5 # Resize pane downward
bind k resize-pane -U 5 # Resize pane upward
bind l resize-pane -R 5 # Resize pane to the right

# TPM (Tmux Plugin Manager) installation
set-option -g @plugin 'tmux-plugins/tpm'
set-option -g @plugin 'christoomey/vim-tmux-navigator'

# Initialize TPM (Keep this line at the end of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'

# Vim-Tmux Navigator settings
# Make tmux aware of Vim panes
is_vim="ps -o state= -o comm= -t '#{pane_tty}' | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"

# Keybindings for seamless navigation
bind -n C-h if-shell "$is_vim" "send-keys C-h" "select-pane -L"
bind -n C-j if-shell "$is_vim" "send-keys C-j" "select-pane -D"
bind -n C-k if-shell "$is_vim" "send-keys C-k" "select-pane -U"
bind -n C-l if-shell "$is_vim" "send-keys C-l" "select-pane -R"

# Pane splitting
# Split horizontally with |
bind-key | split-window -h
bind-key - split-window -v

# Make splitting require the leader (Ctrl+t)
bind | send-prefix \; split-window -h
bind - send-prefix \; split-window -v

# Reload configuration
bind r source-file ~/.tmux.conf \; display-message "Configuration reloaded!"

# Ensure compatibility with older tmux versions for last-pane navigation
tmux_version="$(tmux -V | awk '{print $2}')"
if-shell "[[ $(echo $tmux_version | sed -e 's/\\./ /g' | awk '{print $1$2}') -lt 30 ]]" \
    'bind -n C-\\ if-shell "$is_vim" "send-keys C-\\" "select-pane -l"'

