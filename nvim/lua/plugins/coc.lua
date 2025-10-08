return {
  "neoclide/coc.nvim",
  branch = "release",
  build = "yarn install --frozen-lockfile",
  init = function()
    -- Completion with Tab/S-Tab/CR
    vim.api.nvim_set_keymap("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : CheckBackspace() ? "<Tab>" : coc#refresh()', {expr = true, noremap = true, silent = true})
    vim.api.nvim_set_keymap("i", "<S-TAB>", 'coc#pum#visible() ? coc#pum#prev(1) : "<C-h>"', {expr = true, noremap = true})
    vim.api.nvim_set_keymap("i", "<CR>", 'coc#pum#visible() ? coc#pum#confirm() : "<C-g>u<CR><c-r>=coc#on_enter()<CR>"', {expr = true, noremap = true, silent = true})

    -- <C-Space> to trigger completion
    vim.keymap.set("i", "<C-Space>", "coc#refresh()", {expr = true, noremap = true, silent = true})

    -- Diagnostic navigation
    vim.keymap.set("n", "[g", "<Plug>(coc-diagnostic-prev)", {silent = true})
    vim.keymap.set("n", "]g", "<Plug>(coc-diagnostic-next)", {silent = true})

    -- GoTo code navigation
    vim.keymap.set("n", "gd", "<Plug>(coc-definition)", {silent = true})
    vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
    vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", {silent = true})
    vim.keymap.set("n", "gr", "<Plug>(coc-references)", {silent = true})

    -- Show documentation
    vim.keymap.set("n", "K", ":lua ShowDocumentation()<CR>", {silent = true})

    -- Symbol renaming
    vim.keymap.set("n", "<leader>rn", "<Plug>(coc-rename)")

    -- Formatting selected code
    vim.keymap.set("x", "<leader>f", "<Plug>(coc-format-selected)")
    vim.keymap.set("n", "<leader>f", "<Plug>(coc-format-selected)")

    -- Code actions
    vim.keymap.set("x", "<leader>a", "<Plug>(coc-codeaction-selected)")
    vim.keymap.set("n", "<leader>a", "<Plug>(coc-codeaction-selected)")
    vim.keymap.set("n", "<leader>ac", "<Plug>(coc-codeaction-cursor)")
    vim.keymap.set("n", "<leader>as", "<Plug>(coc-codeaction-source)")
    vim.keymap.set("n", "<leader>qf", "<Plug>(coc-fix-current)")

    -- Refactor actions
    vim.keymap.set("n", "<leader>re", "<Plug>(coc-codeaction-refactor)", {silent = true})
    vim.keymap.set("x", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", {silent = true})
    vim.keymap.set("n", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", {silent = true})

    -- CodeLens action
    vim.keymap.set("n", "<leader>cl", "<Plug>(coc-codelens-action)")

    -- Function and class text objects
    vim.keymap.set("x", "if", "<Plug>(coc-funcobj-i)")
    vim.keymap.set("o", "if", "<Plug>(coc-funcobj-i)")
    vim.keymap.set("x", "af", "<Plug>(coc-funcobj-a)")
    vim.keymap.set("o", "af", "<Plug>(coc-funcobj-a)")
    vim.keymap.set("x", "ic", "<Plug>(coc-classobj-i)")
    vim.keymap.set("o", "ic", "<Plug>(coc-classobj-i)")
    vim.keymap.set("x", "ac", "<Plug>(coc-classobj-a)")
    vim.keymap.set("o", "ac", "<Plug>(coc-classobj-a)")

    -- Scroll float windows/popups
    vim.api.nvim_set_keymap("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', {expr = true, silent = true, noremap = true})
    vim.api.nvim_set_keymap("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', {expr = true, silent = true, noremap = true})
    vim.api.nvim_set_keymap("i", "<C-f>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', {expr = true, silent = true, noremap = true})
    vim.api.nvim_set_keymap("i", "<C-b>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', {expr = true, silent = true, noremap = true})
    vim.api.nvim_set_keymap("v", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', {expr = true, silent = true, noremap = true})
    vim.api.nvim_set_keymap("v", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', {expr = true, silent = true, noremap = true})

    -- Selection ranges
    vim.keymap.set("n", "<C-s>", "<Plug>(coc-range-select)", {silent = true})
    vim.keymap.set("x", "<C-s>", "<Plug>(coc-range-select)", {silent = true})

    -- CocList mappings
    vim.keymap.set("n", "<space>a", ":<C-u>CocList diagnostics<cr>", {silent = true})
    vim.keymap.set("n", "<space>e", ":<C-u>CocList extensions<cr>", {silent = true})
    vim.keymap.set("n", "<space>c", ":<C-u>CocList commands<cr>", {silent = true})
    vim.keymap.set("n", "<space>o", ":<C-u>CocList outline<cr>", {silent = true})
    -- vim.keymap.set("n", "<space>s", ":<C-u>CocList -I symbols<cr>", {silent = true})
    vim.keymap.set("n", "<space>j", ":<C-u>CocNext<CR>", {silent = true})
    vim.keymap.set("n", "<space>k", ":<C-u>CocPrev<CR>", {silent = true})
    vim.keymap.set("n", "<space>p", ":<C-u>CocListResume<CR>", {silent = true})

    -- Statusline
    vim.opt.statusline:append("%{coc#status()}%{get(b:,'coc_current_function','')}")

    -- Command for formatting, folding, organizing imports
    vim.api.nvim_create_user_command("Format", function() vim.fn.CocActionAsync('format') end, {})
    vim.api.nvim_create_user_command("Fold", function(opts) vim.fn.CocAction('fold', unpack(opts.fargs)) end, {nargs = "?"})
    vim.api.nvim_create_user_command("OR", function() vim.fn.CocActionAsync('runCommand', 'editor.action.organizeImport') end, {})

    -- Autocmd group for various events
    local group = vim.api.nvim_create_augroup("mygroup", {})
    vim.api.nvim_create_autocmd("FileType", {
      group = group,
      pattern = { "typescript", "json" },
      command = "setl formatexpr=CocAction('formatSelected')"
    })
    vim.api.nvim_create_autocmd("User", {
      group = group,
      pattern = "CocJumpPlaceholder",
      callback = function() vim.fn.CocActionAsync('showSignatureHelp') end
    })
    vim.api.nvim_create_autocmd("CursorHold", {
      callback = function() vim.fn.CocActionAsync('highlight') end
    })

    -- ShowDocumentation function
    function ShowDocumentation()
      local filetype = vim.bo.filetype
      if vim.fn.CocAction('hasProvider', 'hover') then
        vim.fn.CocActionAsync('doHover')
      else
        vim.api.nvim_feedkeys('K', 'in', false)
      end
    end

    -- CheckBackspace function (needed for Tab completion mapping)
    vim.cmd([[
      function! CheckBackspace() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
      endfunction
    ]])
  end
}
