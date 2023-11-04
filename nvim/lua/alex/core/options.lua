vim.cmd [[
	set clipboard+=unnamedplus
	set termguicolors
	set completeopt=menu,menuone,noselect

	" indention
	set autoindent
	set noexpandtab
	set tabstop=3
	set softtabstop=3
	set shiftwidth=3
	set smartindent

	"set foldenable
	"set foldlevel=99
	"set foldmethod=expr

	set guicursor=a:blinkon100,i-ci:ver150

	" filetype
	filetype on
	filetype plugin on
	filetype indent on

	" line number
	set relativenumber
	set number
	set cursorline
	set scrolloff=8
	set sidescrolloff=8
	set signcolumn=yes

	" search
	set hlsearch
	set incsearch
	set ignorecase
	set smartcase

	" set autochdir
	set autoread
	set colorcolumn=90
	set complete-=t " disable tags
	set splitbelow splitright
	" set wildmenu
	" set wildmode=longest:list,full
	" set laststatus=2
	set showmatch
	set mouse=a
	" set mouse=
	set showcmd
	set nobackup
	set writebackup
	set nowrap
	set noshowmode
	set encoding=UTF-8
	set fileencodings=utf8,cp1251,koi8-r,koi8-u
]]

vim.opt.foldenable = true
vim.opt.foldcolumn = "auto"
vim.opt.foldlevel = 1
-- vim.opt.foldmethod = "expr"
vim.opt.foldmethod = "manual"
