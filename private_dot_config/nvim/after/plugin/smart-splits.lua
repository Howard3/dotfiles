require('smart-splits').setup({
  -- Ignored filetypes (only while resizing)
  ignored_filetypes = {
    'nofile',
    'quickfix',
    'prompt',
  },
  -- Ignored buftypes (only while resizing)
  ignored_buftypes = { 'NvimTree' },
  -- the default number of lines/columns to resize by at a time
  default_amount = 3,
  -- Desired behavior when your cursor is at an edge and you
  -- are moving towards that same edge:
  -- 'wrap' => Wrap to opposite side
  -- 'split' => Create a new split in the desired direction
  -- 'stop' => Do nothing
  at_edge = 'wrap',
  -- when moving cursor between splits left or right,
  -- place the cursor on the same row of the *screen*
  -- regardless of line numbers. False by default.
  -- Can be overridden via function parameter, see Usage.
  move_cursor_same_row = false,
  -- whether the cursor should follow the buffer when swapping
  -- buffers by default; it can also be controlled by passing
  -- `{ move_cursor = true }` or `{ move_cursor = false }`
  -- when calling the Lua function.
  cursor_follows_swapped_bufs = false,
  -- resize mode options
  resize_mode = {
    -- key to exit persistent resize mode
    quit_key = '<ESC>',
    -- keys to use for moving in resize mode
    -- in order of left, down, up' right
    resize_keys = { '<Left>', '<Down>', '<Up>', '<Right>' },
    -- set to true to silence the notifications
    -- when entering/exiting persistent resize mode
    silent = false,
    -- must be functions, they will be executed when
    -- entering or exiting the resize mode
    hooks = {
      on_enter = nil,
      on_leave = nil
    }
  },
  -- ignore these autocmd events (via :h eventignore) while processing
  -- smart-splits.nvim computations, which involve visiting different
  -- buffers and windows. These events will be ignored during processing,
  -- and un-ignored on completed. This only applies to resize events,
  -- not cursor movement events.
  ignored_events = {
    'BufEnter',
    'WinEnter',
  },
  -- enable or disable the tmux integration
  tmux_integration = false,
})

-- recommended mappings
-- resizing splits
-- these keymaps will also accept a range,
-- for example `10<A-Left>` will `resize_left` by `(10 * config.default_amount)`
vim.keymap.set('n', '<A-Left>', require('smart-splits').resize_left)
vim.keymap.set('n', '<A-Down>', require('smart-splits').resize_down)
vim.keymap.set('n', '<A-Up>', require('smart-splits').resize_up)
vim.keymap.set('n', '<A-Right>', require('smart-splits').resize_right)
-- moving between splits
vim.keymap.set('n', '<C-Left>', require('smart-splits').move_cursor_left)
vim.keymap.set('n', '<C-Down>', require('smart-splits').move_cursor_down)
vim.keymap.set('n', '<C-Up>', require('smart-splits').move_cursor_up)
vim.keymap.set('n', '<C-Right>', require('smart-splits').move_cursor_right)
